class UsersController < ApplicationController
    include UsersHelper
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        user_validation(@user)
    end

    def show
        if params[:day] == nil
            @rides = ""
        else
            @rides = current_user.rides.where("day = ?", params[:day])
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :rider)
    end
end