class Attachment < ActiveRecord::Base
  
  belongs_to :story
  belongs_to :uploader, class_name: "User"
  
  validates_presence_of :story, :url
  validates_uniqueness_of :url, scope: :story_id
  
end