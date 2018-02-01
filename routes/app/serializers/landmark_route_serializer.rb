class LandmarkRouteSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :landmark
  belongs_to :route
end
