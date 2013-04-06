class IterationsController < InheritedResources::Base

  include ScopeToTeam
  actions :index, :show
  load_and_authorize_resource

end