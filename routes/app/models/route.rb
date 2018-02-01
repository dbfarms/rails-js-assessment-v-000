class Route < ApplicationRecord
    has_many :landmark_routes
    has_many :landmarks, through: :landmark_routes
    belongs_to :map 
    has_one :category
    
    def push_landmarks(route, landmark_ids)
        landmark_ids.each do |lm|
            landmark = Landmark.find_by(id: lm.to_i)
            route.landmarks << landmark if landmark 
        end 
    end 
    
    def self.highest_ranked(map) 
        @routes = Route.all.find_all {|route| route.map_id == map.id}
        #binding.pry
        ordered_route = []
        
        @routes.each do |route|
            if route.rating != nil  
                ordered_route << route 
            end 
        end 
        
        max = ordered_route.max_by{|e| e.rating}
        @best_routes = ordered_route.find_all{|e| e.rating==max.rating}
        
        return @best_routes
    end 
    
end
