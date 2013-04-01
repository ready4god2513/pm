class PlanningMode < ClassyEnum::Base
end

class PlanningMode::Intelligent < PlanningMode
  
  def description
    "Learns what your team accomplishes over time"
  end
  
end

class PlanningMode::Precise < PlanningMode
  
  def description
    "Adds exactly stated capacity to each iteration"
  end
  
end

class PlanningMode::Manual < PlanningMode
  
  def description
    "You add stories to the iteration"
  end
  
end
