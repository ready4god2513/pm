class Project < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  has_many :stories
  has_and_belongs_to_many :users
  has_many :labels, as: :labelable
  
  attr_accessible :name
  
  validates_presence_of :team, :name
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end