class LandmarksController < ApplicationController
    
    def index
        @landmarks = Landmark.all 
        respond_to do |format|
            format.json {render json: @landmarks }
            format.html {render :index}
        end 
    end 
    
    def new
        @landmark = Landmark.new
    end
    
    def show 
        set_landmark
        @routes = Route.all
        #binding.pry
        respond_to do |format| 
            format.json {render json: @landmark, each_serializer: LandmarkSerializer }
            format.html {render :show }
        end 
    end
    
    def create
        #binding.pry
        @landmark = Landmark.create(landmark_params)
        
        render json: @landmark, status: 201
        #redirect_to landmark_path(@landmark)
    end
    
    private 
    
    def set_landmark
        @landmark = Landmark.find(params[:id])
    end 
    
    def landmark_params
        params.require(:landmark).permit(:name, :history, :route_ids => [])
    end 
    
end 