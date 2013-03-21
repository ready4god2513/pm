class HomeController < ApplicationController
  def start
    @iterations = team.iterations.current
    @stories = Story.in_iterations(@iterations)
  end
end