class StateManager

  def initialize(team)
    @team = team
  end

  def initialze_defaults
    %w(unstarted rejected started finished accepted delivered).each_with_index do |type, index|
      @team.states.create(
        sort_order: index,
        name: type
      )
    end
  end

end