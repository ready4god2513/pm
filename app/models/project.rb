class Project < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  has_many :stories
  has_many :project_users
  has_many :users, through: :project_users
  has_many :labels, as: :labelable
  
  attr_accessible :name
  
  validates_presence_of :team, :name
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end