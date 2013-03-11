class Team < ActiveRecord::Base
  
  has_many :projects
  attr_accessible :key, :name
  
end