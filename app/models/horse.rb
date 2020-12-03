class Horse < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides
    belongs_to :user
    validates_presence_of :name

    def horse_validation(horse)
        if horse.valid?
            horse.save
        else
            flash[:error] = "Please add a name"
        end
    end
end
