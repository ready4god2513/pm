class Iteration < ActiveRecord::Base
  
  belongs_to :project
  has_many :stories
  
  validates_presence_of :project, :pivotal_id, :start, :finish
  
end