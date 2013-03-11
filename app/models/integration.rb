class Integration < ActiveRecord::Base
  
  belongs_to :project
  attr_accessible :active, :field_label, :field_name
  attr_accessible :name, :pivotal_id, :type
  
  validates_presence_of :project, :pivotal_id
  
end