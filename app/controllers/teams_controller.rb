class TeamsController < InheritedResources::Base
  
  actions :show, :create, :update
  load_and_authorize_resource
  
  def create
    create! { root_url(subdomain: resource.slug) }
  end
  
end