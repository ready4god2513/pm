class Project < ActiveRecord::Base
  
  belongs_to :team
  has_many :iterations
  has_many :stories
  has_many :iteration_stories, through: :iterations, class_name: "Story"
  has_many :project_users
  has_many :users, through: :project_users
  has_many :labels, as: :labelable
  
  validates_presence_of :team, :name, :pivotal_id
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # What is the url for the project in pivotal?
  def url
    "https://www.pivotaltracker.com/projects/#{pivotal_id}"
  end
  
end