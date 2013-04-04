class SettingObserver < ActiveRecord::Observer

	def after_update(setting)
		@setting = setting
    update_iterations
	end

  def update_iterations
    if @setting.iteration_length_changed? || @setting.iteration_start_day_changed?
      IterationManager.resize_future_iterations(@setting.team)
    end
  end

end