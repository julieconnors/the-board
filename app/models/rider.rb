class Rider < ApplicationRecord
    belongs_to :user
    has_many :rides
    has_many :horses, through: :rides
    validates_presence_of :name

    def rider_validation(rider)
        if rider.valid?
            rider.save
        else
            flash[:error] = "Please add a name"
        end
    end
end
