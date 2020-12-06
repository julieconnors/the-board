module UsersHelper
    def user_validation(user)
        if user.save
            session[:user_id] = user.id

            redirect_to user_path(user)
        else 
            user_error_generator(user)
            redirect_to "/register"
        end
    end

    def user_error_generator(user)
        if user.name == ""
            flash[:name_error] = "Please add name"
        end
        if user.email == ""
            flash[:email_error] = "Please add email"
        end
        if user.password == nil
            flash[:password_error] = "Please add a password"
        end
    end
end