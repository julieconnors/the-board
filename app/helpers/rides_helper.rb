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

    # def sort_rides
    #     current_user.rides.order(:day)
    # end

    def format_date_from_params(params)
        params[:day].to_date.strftime('%-m/%d/%y')
    end

    def todays_rides
        current_user.rides.where("day = ?", Date.today).order(:time)
    end
end