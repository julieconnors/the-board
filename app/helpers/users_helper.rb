module UsersHelper
    def user_validation(user)
        if user.save
            session[:user_id] = user.id

            redirect_to user_path(user)
        else 
            render :new
        end
    end

    def find_user(user)
        @user = user
        if @user.nil?
            @user = User.new
            @user.valid?
            @user.errors.messages[:email] = "We could not find an account under that email"

            render :new
        else
            authenticate_user(user)    
        end
    end

    def authenticate_user(user)
        @user = user
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            @user.errors.messages[:password] = "Incorrect password"
            
            render :new
        end
    end

    def user_ride_calendar
        if params[:day] == nil
            @rides = ""
        else
            @rides = current_user.rides.where("day = ?", params[:day])
        end
    end
end