class HomeController < ApplicationController
  
  def start
    @iteration = team.iterations.current
    @stories = @iteration.current
  end
  
end