class Iteration < ActiveRecord::Base
  
  audited
  
  LENGTH_OPTIONS = (1..12).map { |n| ["#{n} Weeks", "#{n} Weeks"] }
  DATE_FORMAT = "%A, %B %d, %Y"
  
  belongs_to :team
  has_many :stories
  
  validates_presence_of :start, :finish
  
  scope :current, where{status.eq "current"}.limit(1)
  scope :future, where{status.eq "future"}
  scope :past, where{status.eq "past"}
  
  default_scope order: "start ASC"
  
  classy_enum_attr :status, enum: "IterationState"
  
  attr_accessible :start, :finish, :status
  
  def date_range
    "#{start.strftime(DATE_FORMAT)} - #{finish.strftime(DATE_FORMAT)}"
  end

  def length
    (finish.to_date - start.to_date).to_i
  end

  def points_completed
    stories.completed(self).inject(0) { |sum, story| sum + story.estimate }
  end
  
  
end