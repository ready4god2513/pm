class StoryType < ActiveRecord::Base
  
  belongs_to :team
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
