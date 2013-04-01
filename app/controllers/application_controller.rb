class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include UrlHelper
  
  helper_method :team
  layout "marketing"
  
  def team
    Team.find(request.subdomain) if request.subdomain.present?
  end
  
  def default_serializer_options
    {root: false}
  end
  
end