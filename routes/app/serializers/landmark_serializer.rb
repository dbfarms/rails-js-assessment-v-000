class LandmarkSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :route, serializer: LandmarkRouteSerializer
end
