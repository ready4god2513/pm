class IterationManager
  
  class << self

    def create_next_iterations(num, team)
      (num).times do
        i = Iteration.new
        i.start = team.iterations.last.try(:finish).if_blank? { Time.zone.now }
        i.finish = Chronic.parse("#{team.setting.iteration_length * 7} days from now", now: team.iterations.last.try(:finish).if_blank? { Time.zone.now })
        i.status = "future"
        i.save!
      end
    end
    
    def update_iteration_statuses(team)
      
    end

  end
  
end