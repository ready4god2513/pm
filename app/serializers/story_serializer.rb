class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :description, :slug
  has_one :state
  has_one :story_type
  has_one :project
  has_one :owner
end