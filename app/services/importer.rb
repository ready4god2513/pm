class Importer

  def initialize(team)
    @team = team
    PivotalSync::Client.token = @team.key
  end

  def import_projects
    projects.each do |project|
      p = Project.find_or_initialize_by_pivotal_id(project.id)
      p.team = @team
      p.pivotal_id = project.id
      p.name = project.name
      p.pivotal_created_at = project.created_at
      p.version = project.version
      p.iteration_length = project.iteration_length
      p.week_start_day = project.week_start_day
      p.point_scale = project.point_scale
      p.account = project.account
      p.first_iteration_start_time = project.first_iteration_start_time
      p.current_iteration_number = project.current_iteration_number
      p.enable_tasks = project.enable_tasks
      p.velocity_scheme = project.velocity_scheme
      p.current_velocity = project.current_velocity
      p.initial_velocity = project.initial_velocity
      p.number_of_done_iterations_to_show = project.number_of_done_iterations_to_show
      p.allow_attachments = project.allow_attachments
      p.is_public = project.is_public
      p.use_https = project.use_https
      p.bugs_and_chores_are_estimatable = project.bugs_and_chores_are_estimatable
      p.commit_mode = project.commit_mode
      p.pivotal_last_activity_at = project.last_activity_at
      
      begin
        project.labels.split(",").each do |l|
          p.labels.find_or_create_by_name(l)
        end
      rescue
      end
      
      p.save!
      
      import_memberships(project, p)
      import_iterations(project, p)
    end
  end
  
  def import_memberships(pivotal, project)
    pivotal.memberships.each do |membership|
      u = User.find_or_initialize_by_email(membership.email)
      u.pivotal_id = membership.id
      u.name = membership.name
      u.email = membership.email
      u.initials = membership.initials
      u.color ||= "##{"%06x" % (rand * 0xffffff)}"
      u.save!
      
      pu = project.project_users.find_or_initialize_by_user_id(u.id)
      pu.role = membership.role
      pu.save!
    end
  end
  
  def import_iterations(pivotal, project)
    pivotal.iterations.each do |iteration|
      i = Iteration.find_or_initialize_by_pivotal_id(iteration.id)
      i.project = project
      i.pivotal_id = iteration.id
      i.number = iteration.number
      i.start = iteration.start
      i.finish = iteration.finish
      i.team_strength = iteration.team_strength
      i.save!
      
      import_stories(iteration, i)
    end
  end
  
  def import_stories(pivotal, iteration)
    pivotal.stories.each do |story|
      s = Story.find_or_initialize_by_pivotal_id(story.id)
      s.pivotal_id = story.id
      s.project = iteration.project
      s.iteration = iteration
      s.story_type = StoryType.find_or_create_by_name_and_team_id(story.story_type, @team.id)
      s.url = story.url
      s.estimate = story.estimate
      s.state = State.find_or_create_by_name_and_team_id(story.current_state, @team.id)
      s.description = story.description
      s.name = story.name
      s.pivotal_created_at = story.created_at
      s.pivotal_updated_at = story.updated_at
      s.pivotal_accepted_at = story.accepted_at
      begin
        story.labels.split(",").each do |l|
          s.labels.find_or_create_by_name(l)
        end
      rescue
      end
      s.save!
    end
  end
  
  def import_tasks(story)
    
  end
  
  def import_comments(story)
    
  end
  
  def import_attachments(story)
    
  end

  def projects
    @projects ||= PivotalSync::Project.all
  end

end