class Landmark < ApplicationRecord
    #belongs_to :category
    validates :name, presence: true 
    
    #belongs_to :map
    has_many :landmark_routes
    has_many :routes, through: :landmark_routes
    

end
