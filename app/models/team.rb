class Team < ActiveRecord::Base
  
  has_many :projects
  has_many :users, through: :projects
  has_many :states
  has_many :story_types
  
  validates_presence_of :name, :key
  validates_uniqueness_of :name
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end