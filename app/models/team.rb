class Team < ActiveRecord::Base
  
  has_many :projects
  has_many :users, through: :projects
  
  validates_presence_of :name, :key
  validates_uniqueness_of :name
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end