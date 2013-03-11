class Story < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :iteration
  
  attr_accessible :current_state, :description, :estimate, :labels, :name, :owned_by
  attr_accessible :pivotal_accepted_at, :pivotal_created_at, :requested_by, :story_type, :url
  
end
