class Task < ActiveRecord::Base
  
  belongs_to :story
  validates_presence_of :story, :pivotal_id
  
  default_scope order: "position ASC"
  
end