module ApplicationHelper

    def current_user
        User.find(session[:user_id])
        #    @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in? #checks if a user is logged in
        !!session[:user_id]
    end

    def logged_out_redirection #checks if a user is not logged in and redirects to login page
        if !logged_in?
          redirect_to "/login"
        end
    end
end
