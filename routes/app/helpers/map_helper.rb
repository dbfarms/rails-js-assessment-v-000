module MapHelper
    
    def best_routes(map) 
        best_routes_for_this_map = Route.highest_ranked(map)
        return best_routes_for_this_map
    end 
end 