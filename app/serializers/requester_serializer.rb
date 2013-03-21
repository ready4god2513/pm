class RequesterSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :email
end