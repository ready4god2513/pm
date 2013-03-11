class Story < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :iteration
  
  has_many :tasks
  has_many :attachments
  
  attr_accessible :current_state, :description, :estimate, :labels, :name, :owned_by
  attr_accessible :pivotal_accepted_at, :pivotal_created_at, :requested_by, :story_type, :url
  attr_accessible :pivotal_id
  
  validates_presence_of :project, :iteration, :pivotal_id, :name, :current_state
  
end
