class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create

        @user = User.new(user_params)
        raise params.inspect
        # if @user.save
        #     session[:user_id] = @user.id

        #     redirect_to user_path(@user)
        # else 
        #     redirect_to "/register"
        # end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :rider)
    end
end