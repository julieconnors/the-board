module UsersHelper
    def user_validation(user)
        if user.save
            session[:user_id] = user.id

            redirect_to user_path(user)
        else 
            render :new
        end
    end
end