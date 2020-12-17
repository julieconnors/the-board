class Horse < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides
    belongs_to :user
    validates_presence_of :owner, :nickname
    validates :name, uniqueness: true, presence: true

    def sort_horse_rides
        self.rides.order(:day)
    end
end
