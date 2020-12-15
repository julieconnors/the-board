class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
            
            if @user.nil?
                @user = User.new
                @user.valid?
                @user.errors.messages[:email] = "We could not find an account under that email"

                render :new
            else
                if @user.authenticate(params[:password])
                    session[:user_id] = @user.id

                    redirect_to user_path(@user)
                else
                    @user.errors.messages[:password] = "Incorrect password"
                    
                    render :new
                end
            end
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