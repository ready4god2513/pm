class Iteration < ActiveRecord::Base
  
  belongs_to :project
  attr_accessible :finish, :pivotal_id, :start, :team_strength
  
end