class Api::V1::LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude
end
