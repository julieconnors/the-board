class HorsesController < ApplicationController
    
    def index
        @user = User.find(session[:user_id])
        #current_user
    end

    def new
        #current_user
        @user = User.find(session[:user_id])
    end

    def create
        @user = User.find(session[:user_id])
        horse = @user.horses.build(horse_params)
        horse.save

        redirect_to horse_path(horse)
    end

    def show
        @horse = Horse.find(params[:id])
    end

    private

    def horse_params
        params.require(:horse).permit(:name, :owner)
    end
end