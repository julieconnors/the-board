class Ride < ApplicationRecord
    belongs_to :trainer, :class_name => "User", :foreign_key => "user_id"
    belongs_to :horse
    belongs_to :rider
end
