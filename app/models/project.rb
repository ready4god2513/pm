class Project < ActiveRecord::Base
  
  belongs_to :team
  has_many :stories
  has_many :iteration_stories, through: :iterations, class_name: "Story"
  has_many :project_users
  has_many :users, through: :project_users
  has_many :labels, as: :labelable
  
  validates_presence_of :team, :name
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end