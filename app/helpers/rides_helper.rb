module RidesHelper

    def format_date(ride)
        ride.day.strftime('%-m/%d/%y')
    end

    def format_time(ride)
        ride.time.strftime('%l:%M %p')
    end    

    def ride_validation(ride)
        if ride.valid?
            ride.save

            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def update_ride_validation(ride)
        if ride.valid?
            ride.save

            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def todays_rides
        #raise current_user.rides.inspect
        current_user.rides.where("day = ?", Date.today).order(:time)
    end
end