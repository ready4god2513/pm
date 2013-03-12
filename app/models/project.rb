class Project < ActiveRecord::Base
  
  belongs_to :team
  has_many :iterations
  has_many :stories, through: :iterations
  has_many :project_users
  has_many :users, through: :project_users
  
  validates_presence_of :team, :name, :pivotal_id
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end