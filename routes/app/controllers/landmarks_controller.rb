class LandmarksController < ApplicationController
    
    def index
        @landmarks = Landmark.all 
    end 
    
    def new
        @landmark = Landmark.new
    end
    
    def show 
        set_landmark
        @routes = Route.all
        respond_to do |format| 
            format.json {render json: @landmark }
            format.html {render :show }
        end 
    end
    
    def create
        @landmark = Landmark.create(landmark_params)
        redirect_to landmark_path(@landmark)
    end
    
    private 
    
    def set_landmark
        @landmark = Landmark.find(params[:id])
    end 
    
    def landmark_params
        params.require(:landmark).permit(:name, :history)
    end 
    
end 