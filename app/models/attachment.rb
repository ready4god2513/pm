class Attachment < ActiveRecord::Base
  
  belongs_to :story
  attr_accessible :url
  
  validates_presence_of :story, :url
  validates_uniqueness_of :url, scope: :story_id
  
end