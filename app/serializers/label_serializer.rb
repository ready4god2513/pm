class LabelSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :labelable
end
