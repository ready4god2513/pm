class Attachment < ActiveRecord::Base
  
  belongs_to :story
  
  validates_presence_of :story, :url
  validates_uniqueness_of :url, scope: :story_id
  
end