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
    
    def highest_ranked 
        
    end 
    
end
