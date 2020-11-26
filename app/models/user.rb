class User < ApplicationRecord
    has_secure_password
    has_many :riders
    has_many :rides

end
