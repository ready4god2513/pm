class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :email
end