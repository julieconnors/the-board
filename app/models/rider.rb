class Rider < ApplicationRecord
    belongs_to :trainer, :class_name => "User", :foreign_key => "user_id"
    has_many :rides
    has_many :horses, through: :rides
end
