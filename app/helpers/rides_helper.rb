module RidesHelper

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
            render :update
        end
    end

    def sort_rides
        current_user.rides.order(:day)
    end

    def sort_rider_rides(rider)
        rider.rides.order(:day)
    end

    def sort_horse_rides(horse)
        horse.rides.order(:day)
    end

    def format_date_from_params(params)
        params[:day].to_date.strftime('%-m/%d/%y')
    end

    def todays_rides
        current_user.rides.where("day = ?", Date.today)
    end

    def todays_rider_rides(rider)
        rider.rides.where("day = ?", Date.today)
    end

    def ride_calendar
        if params[:day] == nil
            @rides = ""
        else
            @rides = current_user.rides.where("day = ?", params[:day])
        end
    end
end