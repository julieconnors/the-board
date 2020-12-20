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
            @user = User.new #create a new instance to access errors class
            @user.valid?
                if params[:email] == ""
                    @user.errors.messages[:email] = "Please enter an email address"
                    
                    render :new
                else
                    @user.errors.messages[:email] = "We could not find an account under that email"
            
                    render :new
                end
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

    def has_riders #checks if user has any riders
        if current_user.riders.empty?
            "Please add a rider"
        else
            ""
        end
    end
end