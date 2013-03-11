class Iteration < ActiveRecord::Base
  
  belongs_to :project
  has_many :stories
  attr_accessible :finish, :pivotal_id, :start, :team_strength
  
  validates_presence_of :project, :pivotal_id, :start, :finish
  
end