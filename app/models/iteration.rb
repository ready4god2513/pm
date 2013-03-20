class Iteration < ActiveRecord::Base
  
  belongs_to :project
  has_many :stories
  
  validates_presence_of :project, :pivotal_id, :start, :finish
  
  scope :current, where{
    (start.lte my{DateTime.now.utc.beginning_of_day}) &
    (finish.gte my{DateTime.now.utc.beginning_of_day})
  }
  
  scope :future, where{
    (start.gte my{DateTime.now.utc.beginning_of_day})
  }
  
  scope :past, where{
    (finish.lte my{DateTime.now.utc.beginning_of_day})
  }
  
  def date_range
    "#{start.to_formatted_s(:long)} - #{finish.to_formatted_s(:long)}"
  end
  
end