class MapSerializer < ActiveModel::Serializer
  has_many :routes 
  attributes :id, :name 
end
