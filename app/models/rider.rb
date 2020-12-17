class Rider < ApplicationRecord
    belongs_to :user
    has_many :rides
    has_many :horses, through: :rides
    validates :name, uniqueness: true, presence: true

    def todays_rider_rides
        self.rides.where("day = ?", Date.today).order(:time)
    end

    def sort_rider_rides
        self.rides.order(:day)
    end
end
