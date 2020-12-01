module RidesHelper
    def format_date
        self.day.strftime('%-m/%d/%y')
    end

    def format_time
        self.time.strftime('%l:%M')
    end
end