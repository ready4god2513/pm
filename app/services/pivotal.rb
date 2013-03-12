class Pivotal

  def initialize(team)
    @team = team
    PivotalTracker::Client.use_ssl = true
    PivotalTracker::Client.token = @team.key
  end

  def import
    import_projects
    projects.each { |p| import_stories(p) }
  end

  private

  def import_projects
    projects.each do |project|
      p = @team.projects.find_or_initialize_by_pivotal_id(project.id)
      p.current_velocity = project.current_velocity
      p.initial_velocity = project.initial_velocity
      p.iteration_length = project.iteration_length
      p.labels = project.labels
      p.last_activity_at = project.last_activity_at
      p.name = project.name
      p.pivotal_id = project.id
      p.point_scale = project.point_scale
      p.use_https = project.use_https
      p.velocity_scheme = project.velocity_scheme
      p.week_start_day = project.week_start_day
      p.save!
    end
  end

  def import_stories(project)
    project.stories.all.each do |story|
      s = Story.find_or_initialize_by_pivotal_id(story.id)
      s.project = Project.find_by_pivotal_id(project.id)
      s.pivotal_id = story.id
      s.url = story.url
      s.pivotal_created_at = story.created_at
      s.pivotal_accepted_at = story.accepted_at
      s.name = story.name
      s.description = story.description
      s.story_type = story.story_type
      s.estimate = story.estimate
      s.current_state = story.current_state
      s.requested_by = story.requested_by
      s.owned_by = story.owned_by
      s.labels = story.labels
      s.other_id = story.other_id
      s.deadline = story.try(:deadline)
      s.save!
    end
  end

  def projects
    @projects ||= PivotalTracker::Project.all
  end

end