class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :sort_order, :hidden
end