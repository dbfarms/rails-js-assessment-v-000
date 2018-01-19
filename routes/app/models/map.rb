class Map < ApplicationRecord
    has_many :routes 
    
    #serialize :routes, Array
end
