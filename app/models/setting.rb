class Setting < ActiveRecord::Base
  belongs_to :team
  attr_accessible :iteration_length, :planning_mode, :points
end
