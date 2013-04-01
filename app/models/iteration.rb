class Iteration < ActiveRecord::Base
  
  LENGTH_OPTIONS = (1..12).map { |n| "#{n} Weeks"}
  
  belongs_to :team
  has_many :stories
  
  validates_presence_of :start, :finish
  
  scope :current, where{status.eq "current"}.limit(1)
  scope :future, where{status.eq "future"}
  scope :past, where{status.eq "past"}
  
  default_scope order: "start ASC"
  
  classy_enum_attr :status, enum: "IterationState"
  
  def date_range
    "#{start.to_formatted_s(:long)} - #{finish.to_formatted_s(:long)}"
  end
  
  
end