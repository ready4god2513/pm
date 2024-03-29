class Attachment < ActiveRecord::Base
  
  belongs_to :attachable, polymorphic: true
  belongs_to :uploader, class_name: "User"
  
  validates_presence_of :attachable
  
  mount_uploader :file, AttachmentUploader
  
  attr_accessible :file
   
end