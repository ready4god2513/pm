class StoryStatusMailer < ActionMailer::Base
  default from: "story@worktogether.com"

    def new_assignment(story, developer)
      @story, @developer = story, developer
      mail(to: developer.email, subject: "New Assignment")
    end

end