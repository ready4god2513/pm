class TeamsController < InheritedResources::Base
  
  actions :create
  
  def create
    create! { root_url(subdomain: resource.slug) }
  end
  
end