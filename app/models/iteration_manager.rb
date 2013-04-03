class IterationManager
  
  class << self

    def create_next_iterations(num, team)
      Delorean.time_travel_to Chronic.parse(
        "next #{team.setting.iteration_start_day}", 
        now: team.iterations.last.try(:finish).if_blank? { Time.zone.now }
      )
      
      (num).times do
        finish = Chronic.parse("#{((team.setting.iteration_length * 7) - 1)} days from now")
        
        i = team.iterations.build
        i.start = Date.today
        i.finish = finish
        i.status = "future"
        i.save!
        
        Delorean.time_travel_to (team.setting.iteration_length * 7).days.from_now
      end
      
      Delorean.back_to_the_present
    end
    
    def update_iteration_statuses(team)
      
    end

  end
  
end