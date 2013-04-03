class Setting < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  attr_accessible :iteration_length, :planning_mode, :points_per_iteration, :iteration_start_day
  classy_enum_attr :planning_mode
  
end