class Ride < ApplicationRecord
    belongs_to :horse
    belongs_to :rider
    validates_presence_of :day
    validates_presence_of :time
    
    def ride_validation
        if self.valid?
            self.save

            redirect_to rider_ride_path(self.rider_id, self)
        end
    end

    def format_date
        self.day.strftime('%-m/%d/%y')
    end

    def format_time
        self.time.strftime('%l:%M')
    end
end
