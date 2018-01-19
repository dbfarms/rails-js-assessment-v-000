class Category < ApplicationRecord
    has_many :routes
    has_many :landmarks, through: :routes 
end
