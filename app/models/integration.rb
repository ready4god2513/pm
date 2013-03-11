class Integration < ActiveRecord::Base
  belongs_to :project
  attr_accessible :active, :field_label, :field_name, :name, :pivotal_id, :type
end
