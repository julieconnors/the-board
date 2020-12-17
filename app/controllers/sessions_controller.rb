class SessionsController < ApplicationController
    include UsersHelper

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
            
        find_user(@user)
    end

    def destroy
        session.delete :user_id

        redirect_to "/"
    end

    def omniauth
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.name = auth[:info][:name] 
        end
        
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end