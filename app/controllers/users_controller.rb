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
        logged_out_redirection

        user_ride_calendar
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :rider)
    end
end