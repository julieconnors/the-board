class Horse < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides
end
