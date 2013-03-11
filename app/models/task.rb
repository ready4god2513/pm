class Task < ActiveRecord::Base
  
  belongs_to :story
  attr_accessible :complete, :description, :pivotal_created_at, :pivotal_id, :position
  
  validates_presence_of :story, :pivotal_id
  
end