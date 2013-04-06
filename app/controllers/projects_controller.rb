class ProjectsController < InheritedResources::Base
  include ScopeToTeam
end