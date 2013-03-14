class StoryType < ActiveRecord::Base
  
  belongs_to :team
  has_many :stories
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
