class RoutesController < ApplicationController 
    helper_method :params
    
    def new 
        @route = Route.new 
        #@map = Map.find(params["map_id"])
        set_map
    end 
    
    def index
        set_map
        @routes = @map.routes 
        #render json: @map.routes
        #binding.pry
        respond_to do |format|
           format.json {render json: @map.routes }
           format.html {redirect_to map_path(@map.id) }
        end 
    end 
    
    def show
        #binding.pry
        set_route
        respond_to do |format|
            format.json {render json: @route, include: ['maps', 'landmarks']}
            format.html {render :show  } #for some reason redirect_to wasn't working here!!!!!!!!
        end 
    end 
    
    def create 
        @route = Route.create(route_params)
        @route.save
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
        @route.push_landmarks(@route, params["route"]["landmark_ids"])
        @route.save
        map = Map.find(params["route"]["map_id"])
        redirect_to map_route_path(map.id, @route.id)
    end 
    
    
    private 
    
    def set_map 
        @map = Map.find(params["map_id"])
    end 
    
    def set_route
        #binding.pry
        @route = Route.find(params[:id]) #if params[:id]
    end 
    
    def route_params
        params.require(:route).permit(:name, :landmark_ids, :map_id)
    end 
    
end 