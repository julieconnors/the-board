class Rider < ApplicationRecord
    belongs_to :user
    has_many :rides
    has_many :horses, through: :rides
end
