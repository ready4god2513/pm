class Iteration < ActiveRecord::Base
  
  LENGTH_OPTIONS = (1..12).map { |n| "#{n} Weeks"}
  
  belongs_to :team
  has_many :stories
  
  validates_presence_of :start, :finish
  
  scope :current, where{status.eq "current"}.limit(1)
  scope :future, where{status.eq "future"}
  scope :past, where{status.eq "past"}
  
  default_scope order: "start ASC"
  
  class_enum_attr :status, enum: "IterationState"
  
  def date_range
    "#{start.to_formatted_s(:long)} - #{finish.to_formatted_s(:long)}"
  end
  
  class << self
    
    def create_next_iterations(num, team)
      num.times do |n|
        i = Iteration.new
        i.start = team.iterations.last.finish.if_blank? { Date.today }
        i.finish = Chronic.parse("#{team.setting.iteration_length} from now", now: team.iterations.last.finish.if_blank? { Date.today })
        i.save!
      end
    end
    
  end
  
  
end