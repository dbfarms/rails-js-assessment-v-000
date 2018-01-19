class RoutesController < ApplicationController 
    helper_method :params
    
    def new 
        @route = Route.new 
        @map = Map.find(params["map_id"])
    end 
    
    def index
    end 
    
    def show
        set_route 
    end 
    
    def create 
        @route = Route.create(route_params)
        @category = Category.find(params["route"]["id"]) 
        @route.save
        @category.save
        @route.push_landmarks(@route, params["route"]["landmark_ids"])
        
        
        map = Map.find(params["route"]["map_id"])
        redirect_to map_route_path(map.id, @route.id)
    end 
    
    def edit 
        @route = set_route
        @map = Map.find(params["map_id"])        
    end 
    
    def update 
        #binding.pry
        @route = Route.find(params["route"]["id"])
        @route.update(route_params)
        @category = Category.find(params["route"]["id"]) 
        @category.routes << @route
        @route.category = Category.find(params["route"]["id"])
        @route.push_landmarks(@route, params["route"]["landmark_ids"])
        @route.save
        map = Map.find(params["route"]["map_id"])
        redirect_to map_route_path(map.id, @route.id)
    end 
    
    
    private 
    
    def set_route
        #binding.pry
        @route = Route.find(params[:id]) #if params[:id]
    end 
    
    def route_params
        params.require(:route).permit(:name, :landmark_ids, :map_id)
    end 
    
end 