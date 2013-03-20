class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include UrlHelper
  
  helper_method :team
  
  def team
    Team.find(request.subdomain) if request.subdomain.present?
  end
  
end