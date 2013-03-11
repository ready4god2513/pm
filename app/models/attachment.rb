class Attachment < ActiveRecord::Base
  
  belongs_to :story
  attr_accessible :url
  
end