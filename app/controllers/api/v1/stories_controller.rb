class Api::V1::StoriesController < Api::V1::BaseController
  
  inherit_resources
  has_scope :in_iterations, type: :boolean, default: true do |controller, scope|
    scope.in_iterations(controller.team.iterations.current)
  end
  
end