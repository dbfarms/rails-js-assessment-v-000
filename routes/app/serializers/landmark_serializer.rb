class LandmarkSerializer < ActiveModel::Serializer
  attributes :id, :name, :history
  has_many :routes, through: :landmark_routes #, serializer: RouteSerializer, includes: :name 
  has_many :landmark_routes
  
  
  def routes
    customized_routes = []
    object.routes.each do |route|
      custom_route = route.attributes
      customized_routes.push(custom_route)
    end
    #binding.pry
    return customized_routes
  end
  
end
