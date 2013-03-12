class User < ActiveRecord::Base
  
  has_many :project_users
  has_many :projects, through: :project_users
  
  validates_presence_of :name, :email, :pivotal_id
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end