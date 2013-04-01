class Task < ActiveRecord::Base
  
  belongs_to :story
  validates_presence_of :story
  
  default_scope order: "position ASC"
  
end