class Setting < ActiveRecord::Base
  belongs_to :team
  attr_accessible :iteration_length, :planning_mode, :points_per_iteration, :iteration_start_day
  
  validates_inclusion_of :iteration_length, in: Iteration::LENGTH_OPTIONS
  
  classy_enum_attr :planning_mode
end
