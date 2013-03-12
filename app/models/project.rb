class Project < ActiveRecord::Base
  
  belongs_to :team
  has_many :iterations
  has_many :stories
  has_many :iteration_stories, through: :iterations, class_name: "Story"
  has_many :project_users
  has_many :users, through: :project_users
  
  validates_presence_of :team, :name, :pivotal_id
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end