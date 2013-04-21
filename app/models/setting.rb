class Setting < ActiveRecord::Base
  
  audited
  
  belongs_to :team
  attr_accessible :iteration_length, :planning_mode, 
    :points_per_iteration, :iteration_start_day, :estimates_available
  classy_enum_attr :planning_mode

  def estimates_available_as_array
    estimates_available.split(",").map(&:to_i).sort
  end
  
end