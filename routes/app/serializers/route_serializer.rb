class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :map_id, :rating 
  belongs_to :map, serializer: MapRouteSerializer
  has_many :landmarks, through: :landmark_routes #, serializer: LandmarkSerializer, includes: :name
  has_many :landmark_routes

 def landmarks
    customized_landmarks = []
    #binding.pry
    object.landmarks.each do |landmark|
      custom_landmarks = landmark.attributes
      customized_landmarks.push(custom_landmarks)
    end

    return customized_landmarks
  end


end
