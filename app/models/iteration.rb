class Iteration < ActiveRecord::Base
  
  belongs_to :team
  has_many :stories
  
  validates_presence_of :start, :finish
  
  scope :current, where{current.eq true}.limit(1)
  scope :future, where{future.eq true}
  scope :past, where{past.eq true}
  
  def date_range
    "#{start.to_formatted_s(:long)} - #{finish.to_formatted_s(:long)}"
  end
  
  def self.current_iteration_range
    current_iteration = Iteration.current
    [
      current_iteration.finish.strftime("%b %d"), 
      current_iteration.finish.strftime("%b %d")
    ].join(" - ")
  end
  
end