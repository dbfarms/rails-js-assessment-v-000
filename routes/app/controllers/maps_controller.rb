class MapsController < ApplicationController 
    helper_method :params
    
    def index 
        @maps = Map.all
        
        respond_to do |format|
            format.json {render json: @maps }
            format.html {render :index }
        end 
    end 
    
    def show
        set_map 
        @rating
       # binding.pry
       respond_to do |format|
           format.json {render json:@map }
           format.html {render :show }
       end 
    end 
    
    def create
        @map = Map.find(params["map"]["id"])
        redirect_to map_path(@map) #binding.pry
    end 
    
    #def routes_index 
    #    set_map
    #    @routes = @map.routes 
    #    render template: 'routes/index'
    #end 
    
    #def route 
    #    set_map
    #    set_route 
    #    render template: 'routes/show'
    #end 
    
    private
    
    def set_map 
        if params["id"] == ":id"
           @map = Map.find(params["map"])
        else
            @map = Map.find(params["id"])
        end 
        @rating = params["rating"] if params["rating"]
    end 
    
    def set_route
        @route = Route.find(params[:route_id])
    end 
    
end 