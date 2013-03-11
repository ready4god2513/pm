class ProjectMembership < ActiveRecord::Base
  belongs_to :project
  attr_accessible :email, :initials, :name, :pivotal_id, :role
end
