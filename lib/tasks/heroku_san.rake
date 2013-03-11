require 'heroku_san'

class MyStrategy < HerokuSan::Deploy::Base
  def deploy
    puts "Using custom Heroku deploy strategy."
    puts
    Rake::Task['heroku:maintenance_on'].invoke
    puts "Maintenance mode enabled."

    super

    if %w[alpha beta].include? @stage.name
      @stage.run('rake db:reload')
    else
      @stage.run('rake db:migrate')
    end

    Rake::Task['heroku:maintenance_off'].invoke
    puts "Maintenance mode disabled."
    puts "Done."
  end
end

HerokuSan.project = HerokuSan::Project.new(Rails.root.join("config", "heroku.yml"), :deploy => MyStrategy)