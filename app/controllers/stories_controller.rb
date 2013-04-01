class StoriesController < InheritedResources::Base
  
  belongs_to :project, optional: true
  belongs_to :iteration, optional: true
  
end