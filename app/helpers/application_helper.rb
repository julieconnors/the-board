module ApplicationHelper

    def current_user
        User.find(session[:user_id])
    end

    def logged_in? #checks if a user is logged in
        !!session[:user_id]
    end
end
