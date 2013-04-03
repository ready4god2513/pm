class Comment < ActiveRecord::Base
  
  audited
  
  belongs_to :story
  belongs_to :user
  validates_presence_of :story
end