class Team < ActiveRecord::Base
  
  has_many :projects
  has_many :iterations
  has_many :states
  has_many :story_types
  has_one :setting
  has_and_belongs_to_many :users
  
  validates_presence_of :name, :setting
  validates_uniqueness_of :key
  
  attr_accessible :name, :setting_attributes
  accepts_nested_attributes_for :setting
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  before_validation :generate_api_key
  
  def generate_api_key
    self.key ||= SecureRandom.uuid
  end
  
end