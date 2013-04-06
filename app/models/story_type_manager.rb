class StoryTypeManager

  def initialize(team)
    @team = team
  end

  def initialze_defaults
    %w(bug feature chore release).each_with_index do |type, index|
      @team.story_types.create(
        sort_order: index,
        name: type
      )
    end
  end

end