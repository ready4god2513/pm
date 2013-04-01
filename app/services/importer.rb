class Importer

  def initialize(team)
    @team = team
    PivotalSync::Client.token = @team.key
  end
  
  def start
    import_projects
  end

  def projects
    @projects ||= PivotalSync::Project.all
  end
  
  private
  
  def import_projects
    projects.each do |project|
      p = @team.projects.find_or_initialize_by_pivotal_id(project.id)
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
      # Iteration id starts at 1 for each project, so we need to scope everything
      # through the project or we end up overwriting things
      i = project.iterations.find_or_initialize_by_pivotal_id(iteration.id)
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
      # s.pivotal_id = story.id
      s.project = iteration.project
      s.iteration = iteration
      s.story_type = @team.story_types.find_or_create_by_name(story.story_type)
      s.url = story.url
      s.estimate = story.estimate
      s.state = @team.states.find_or_create_by_name(story.current_state)
      s.description = story.description
      s.name = story.name
      # s.pivotal_created_at = story.created_at
      # s.pivotal_updated_at = story.updated_at
      # s.pivotal_accepted_at = story.accepted_at
      s.requestor = User.find_by_name(story.requested_by.name)
      s.owner = User.find_by_name(story.owned_by.name)
      begin
        story.labels.split(",").each do |l|
          s.labels.find_or_create_by_name(l)
        end
      rescue
      end
      s.save!
      
      import_tasks(story, s)
      import_comments(story, s)
      import_attachments(story, s)
    end
  end
  
  def import_tasks(pivotal, story)
    pivotal.tasks.each do |task|
      t = story.tasks.find_or_initialize_by_pivotal_id(task.id)
      t.pivotal_id = task.id
      t.description = task.description
      t.position = task.position
      t.complete = task.complete
      t.pivotal_created_at = task.created_at
      t.save!
    end
  end
  
  def import_comments(pivotal, story)
    pivotal.comments.each do |comment|
      c = story.comments.find_or_initialize_by_pivotal_id(comment.id)
      c.text = comment.text
      c.pivotal_created_at = comment.created_at
      c.user = User.find_by_name(comment.author.name)
      c.save!
    end
  end
  
  def import_attachments(pivotal, story)
    pivotal.attachments.each do |attachment|
      a = story.attachments.find_or_initialize_by_pivotal_id(attachment.id)
      a.pivotal_id = attachment.id
      a.filename = attachment.filename
      a.url = attachment.url
      a.pivotal_uploaded_at = attachment.uploaded_at
      a.save!
    end
  end

end