class UsersController < InheritedResources::Base
  include ScopeToTeam
end