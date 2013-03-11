class Project < ActiveRecord::Base
  has_many :iterations
  attr_accessible :allow_attachments, :bugs_and_chores_are_estimatable, :commit_mode, :current_velocity
  attr_accessible :initial_velocity, :iteration_length, :labels, :last_activity_at, :name
  attr_accessible :number_of_done_iterations_to_show, :pivotal_id, :point_scale, :public
  attr_accessible :use_https, :velocity_scheme, :week_start
end
