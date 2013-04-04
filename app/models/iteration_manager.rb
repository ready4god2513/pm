class IterationManager
  
  class << self

    def create_next_iterations(num, team)

      next_date = team.iterations.last.try(:finish).if_blank? { Time.zone.now }
      
      (num).times do
        i = team.iterations.build
        i = set_iteration_dates(i, next_date, team.setting.iteration_length)
        next_date = Chronic.parse("1 day from now", now: i.finish)
      end
    end
    

    # When the team changes the length of the iterations
    # we want to ensure that all future iterations are
    # updateed to the correct length.

    # THIS WILL NOT UPDATE THE CALCULATIONS
    # FOR STORIES / POINTS IN AN ITERATION.  THAT WILL
    # BE HANDLED ELSEWHERE.
    def resize_future_iterations(team)
      next_date = Chronic.parse("next #{team.setting.iteration_start_day}")
      length = team.setting.iteration_length

      team.iterations.future.each do |iteration|
        i = set_iteration_dates(iteration, next_date, length)
        next_date = Chronic.parse("1 day from now", now: i.finish)
      end
    end


    def set_iteration_dates(iteration, start, length)
      finish = Chronic.parse("#{((length * 7) - 1)} days from now", now: start)

      iteration.start = start
      iteration.finish = finish
      iteration.status = find_current_status(iteration)
      iteration.save!

      iteration
    end

    def find_current_status(iteration)
      if iteration.finish < Date.today
        "past"
      elsif iteration.start > Date.today
        "future"
      else
        "current"
      end
    end

  end
  
end