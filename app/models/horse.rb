class Horse < ApplicationRecord
    belongs_to :owner
    has_many :rides
    has_many :riders, through :rides
end
