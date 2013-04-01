class IterationManager
  
  class << self

    def create_next_iterations(num, team)
      num.times do |n|
        i = Iteration.new
        i.start = team.iterations.last.try(:finish).if_blank? { Date.today }
        i.finish = Chronic.parse("#{team.setting.iteration_length} from now", now: team.iterations.last.try(:finish).if_blank? { Date.today })
        i.save!
      end
    end
    
    def set_current_iteration(team)
      
    end

  end
  
end