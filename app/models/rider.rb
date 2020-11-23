class Rider < ApplicationRecord
    has_many :rides
    has_many :horses, through: :rides
end
