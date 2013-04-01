class HomeController < ApplicationController
  
  layout "marketing"
  
  def start
    @team = Team.new
  end
  
end