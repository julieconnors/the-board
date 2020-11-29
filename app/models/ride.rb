class Ride < ApplicationRecord
    belongs_to :horse
    belongs_to :rider

    def format_date
        self.day.strftime('%-m/%d/%y')
    end

    def format_time
        self.time.strftime('%l:%M')
    end
end
