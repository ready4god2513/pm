class StoryTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :sort_order, :hidden
end