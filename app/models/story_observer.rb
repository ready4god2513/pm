class StoryObserver < ActiveRecord::Observer

  def after_save(story)
    @story = story

    # Clear the cache related to iterations for the team
    @story.iteration.team.iterations.each { |i| i.touch }
  end

  def after_create(story)
    @story = story
    notify_developers
  end


  def notify_developers
    @story.developers.each do |developer|
      StoryStatusMailer.new_assignment(@story, developer).deliver
    end
  end

end