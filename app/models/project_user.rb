class ProjectUser < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user
  attr_accessible :role
  
  validates_presence_of :project, :user, :role
  
end