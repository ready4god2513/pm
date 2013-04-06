class StoriesController < InheritedResources::Base
  
  include ScopeToTeam
  belongs_to :project, optional: true
  belongs_to :iteration, optional: true
  load_and_authorize_resource
  
end