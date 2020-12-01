class User < ApplicationRecord
    has_secure_password
    has_many :riders
    has_many :rides
    has_many :horses
    validates_presence_of :username, :password, :name

end
