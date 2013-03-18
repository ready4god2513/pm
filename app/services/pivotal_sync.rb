class PivotalSync

  def initialize(team)
    @team = team
    PivotalTracker::Client.use_ssl = true
    PivotalTracker::Client.token = @team.key
  end

  def import_projects
    projects.each do |project|
      p = @team.projects.find_or_initialize_by_pivotal_id(project.id)
      p.current_velocity = project.current_velocity
      p.initial_velocity = project.initial_velocity
      p.iteration_length = project.iteration_length
      project.labels.to_s.split(",").each do |l|
        p.labels.find_or_create_by_name(l)
      end
      p.last_activity_at = project.last_activity_at
      p.name = project.name
      p.pivotal_id = project.id
      p.point_scale = project.point_scale
      p.use_https = project.use_https
      p.velocity_scheme = project.velocity_scheme
      p.week_start_day = project.week_start_day
      p.save!
      
      import_memberships(project)
      import_iterations(project)
    end
  end

  def import_stories(project, iteration)
    project.stories.all.each do |story|
      s = Story.find_or_initialize_by_pivotal_id(story.id)
      s.project = Project.find_by_pivotal_id(project.id)
      s.pivotal_id = story.id
      s.iteration = Iteration.find_by_pivotal_id(iteration.id)
      s.url = story.url
      s.pivotal_created_at = story.created_at
      s.pivotal_accepted_at = story.accepted_at
      s.name = story.name
      s.description = story.description
      s.story_type = find_or_create_story_type(story.story_type)
      s.estimate = story.estimate
      s.state = find_or_create_state(story.current_state)
      s.requestor = User.find_by_name(story.requested_by)
      s.owner = User.find_by_name(story.owned_by)
      story.labels.to_s.split(",").each do |l|
        s.labels.find_or_create_by_name(l)
      end
      s.other_id = story.other_id
      s.deadline = story.try(:deadline)
      s.save!
      
      import_notes(story)
      import_tasks(story)
      import_attachments(story)
    end
  end
  
  def import_iterations(project)
    project.iterations.all.each do |iteration|
      i = Iteration.find_or_initialize_by_pivotal_id(iteration.id)
      i.pivotal_id = iteration.id
      i.project = Project.find_by_pivotal_id(project.id)
      i.start = iteration.start
      i.finish = iteration.finish
      i.save!
      
      import_stories(project, iteration)
    end
  end
  
  def find_or_create_story_type(type)
    t = StoryType.find_or_initialize_by_team_id_and_name(@team.id, type)
    t.name = type
    t.team = @team
    t.save!
    t
  end
  
  def find_or_create_state(state)
    s = State.find_or_initialize_by_team_id_and_name(@team.id, state)
    s.name = state
    s.team = @team
    s.sort_order ||= State.count + 1
    s.save!
    s
  end
  
  def import_memberships(project)
    project.memberships.all.each do |membership|
      u = User.find_or_initialize_by_email(membership.email)
      u.pivotal_id = membership.id
      u.name = membership.name
      u.email = membership.email
      u.initials = membership.initials
      u.color ||= "##{"%06x" % (rand * 0xffffff)}"
      u.save!
      
      p = Project.find_by_pivotal_id(project.id)
      pu = u.project_users.find_or_initialize_by_project_id(p.id)
      pu.user = u
      pu.project = p
      pu.role = membership.role
      pu.save!
    end
  end

  def import_notes(story)
    story.notes.all.each do |note|
      n = Note.find_or_initialize_by_pivotal_id(note.id)
      n.pivotal_id = note.id
      n.text = note.text
      n.user = User.find_by_name(note.author)
      n.noted_at = note.noted_at
      n.story = Story.find_by_pivotal_id(note.story_id)
      n.save!
    end
  end

  def import_tasks(story)
    story.tasks.all.each do |task|
      t = Task.find_or_initialize_by_pivotal_id(task.id)
      t.pivotal_id = task.id
      t.description = task.description
      t.position = task.position
      t.complete = task.complete
      t.pivotal_created_at = task.created_at
      t.story = Story.find_by_pivotal_id(story.id)
      t.save!
    end
  end

  def import_attachments(story)
    story.attachments.each do |attachment|
      a = Attachment.find_or_initialize_by_pivotal_id(attachment.id)
      a.pivotal_id = attachment.id
      a.filename = attachment.filename
      a.uploader = User.find_by_name(attachment.uploaded_by)
      a.uploaded_at = attachment.uploaded_at
      a.url = attachment.url
      a.status = attachment.status
      a.story = Story.find_by_pivotal_id(story.id)
      a.save!
    end
  end

  def projects
    @projects ||= PivotalTracker::Project.all
  end
  
  def stories
    @stories ||= projects.map { |p| p.stories.all }.flatten
  end

end