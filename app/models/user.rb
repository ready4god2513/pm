class User < ActiveRecord::Base
  
  has_many :project_users
  has_many :projects, through: :project_users
  attr_accessible :email, :initials, :name, :pivotal_id
  
end