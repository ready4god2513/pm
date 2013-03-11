class Task < ActiveRecord::Base
  belongs_to :story
  attr_accessible :complete, :description, :pivotal_created_at, :pivotal_id, :position
end
