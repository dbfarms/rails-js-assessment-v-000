class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :map_id, :category_id, :rating 
  belongs_to :map, serializer: MapRouteSerializer
  has_many :landmarks
end
