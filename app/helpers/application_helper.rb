module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in? #checks if a user is logged in
        !!session[:user_id]
    end

    def logged_out_redirection #checks if a user is not logged in and redirects to login page
        if !logged_in?
            flash[:logged_out] = "Please login or signup"
            
            redirect_to root_path
        end
    end
end
