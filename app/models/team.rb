class Team < ActiveRecord::Base
  
  has_many :projects
  has_many :users, through: :projects
  attr_accessible :key, :name
  
  validates_presence_of :name, :key
  validates_uniqueness_of :name
  
end