class Ride < ApplicationRecord
    belongs_to :horse
    belongs_to :rider
end
