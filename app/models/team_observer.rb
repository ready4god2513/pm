class TeamObserver < ActiveRecord::Observer
  
  def after_create(team)
    @team = team
    initialize_iterations
    initialize_story_types
    initialize_states
  end
  
  def initialize_iterations
    IterationManager.create_next_iterations(10, @team)
  end

  def initialize_story_types
    StoryTypeManager.new(@team).initialze_defaults
  end

  def initialize_states
    StateManager.new(@team).initialze_defaults
  end
  
end