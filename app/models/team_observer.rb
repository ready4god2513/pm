class TeamObserver < ActiveRecord::Observer
  
  def after_create(team)
    @team = team
  end
  
  def initialize_iterations
    IterationManager.create_next_iterations(10, @team)
  end
  
end