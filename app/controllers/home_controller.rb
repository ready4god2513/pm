class HomeController < ApplicationController
  def start
    @iterations = team.iterations.current
  end
end