class LandmarkSerializer < ActiveModel::Serializer
  attributes :id, :name, :history
  belongs_to :route, serializer: LandmarkRouteSerializer
end
