class IterationsController < InheritedResources::Base

  include ScopeToTeam
  actions :index, :show

end