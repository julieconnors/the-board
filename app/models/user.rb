class User < ApplicationRecord
    has_secure_password
    has_many :riders
    has_many :rides
    has_many :horses

    def current_user
        User.find_by(id: session[:user_id])
    end
end
