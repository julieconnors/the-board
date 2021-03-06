class User < ApplicationRecord
    has_secure_password
    has_many :riders
    has_many :rides
    has_many :horses
    validates :name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true

end
