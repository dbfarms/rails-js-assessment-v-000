class WelcomeController < ApplicationController
    skip_before_action :authenticate_user!
    
    def home 
        @user = current_user 
        @maps = Map.all
    end 
    
end 