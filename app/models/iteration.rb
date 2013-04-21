class Iteration < ActiveRecord::Base
  
  audited
  
  LENGTH_OPTIONS = (1..12).map { |n| ["#{n} Weeks", "#{n} Weeks"] }
  DATE_FORMAT = "%A, %B %d, %Y"
  
  belongs_to :team
  has_many :stories
  has_many :projects, through: :stories
  
  validates_presence_of :start, :finish
  
  scope :current, where{status.eq "current"}.limit(1)
  scope :future, where{status.eq "future"}
  scope :past, where{status.eq "past"}
  
  default_scope order: "start ASC"
  
  classy_enum_attr :status, enum: "IterationState"
  
  attr_accessible :start, :finish, :status

  extend FriendlyId
  friendly_id :date_range, use: :slugged
  
  def expected_completion_percentage
    Rails.cache.fetch(self.class.name.downcase.to_sym => self, __method__.to_sym => true) do
      average_daily = points_started_or_completed / current_day_num
      result = (average_daily * length) / total_points
      [[0, result].max, 100].min.to_f
    end
  end
  
  # calculate how many points that they have started 
  # and compare to how many they will finish by the end of the iteration
  # calulate total point in iteration period
  def points_started_or_completed
    Rails.cache.fetch(self.class.name.downcase.to_sym => self, __method__.to_sym => true) do
      stories.started_or_completed(team).sum(:estimate)
    end
  end
  
  def total_points
    Rails.cache.fetch(self.class.name.downcase.to_sym => self, __method__.to_sym => true) do
      stories.sum(:estimate)
    end
  end
  
  def current_day_num
    (Time.zone.now.to_date - start.to_date).to_i
  end
  
  def date_range
    return if start.blank? || finish.blank?
    "#{start.strftime(DATE_FORMAT)} - #{finish.strftime(DATE_FORMAT)}"
  end

  alias :name :date_range

  def length
    (finish.to_date - start.to_date).to_i
  end

  def points_completed
    Rails.cache.fetch(self.class.name.downcase.to_sym => self, __method__.to_sym => true) do
      stories.completed(self).inject(0) { |sum, story| sum + story.estimate }
    end
  end
  
  
end