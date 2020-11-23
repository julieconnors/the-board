class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #raise params.inspect
        #byebug
        @user = User.new(user_params)

        if @user.save && @user.rider
            #@rider = Rider.create(params[:user][:name])
            session[:user_id] = @user.id

            #I want to then redirect to rider or owners create path
            redirect_to new_rider_path
        else 
            redirect_to "/register"
        end
    end

    def show
        #raise params.inspect
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :rider)
    end
end