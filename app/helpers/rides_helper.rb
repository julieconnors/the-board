module RidesHelper

    def ride_validation(ride)
        if ride.valid?
            ride.save

            redirect_to user_path(current_user)
        else
            error_generator(ride)

            render :new
        end
    end

    def update_ride_validation
        if ride.valid?
            ride.save

            redirect_to user_path(current_user)
        else
            error_generator(ride)

            render :update
        end
    end

    def error_generator(ride)
        if ride.time == nil
            flash[:time_error] = "Please select a ride time" 
        end
        if ride.day == nil
            flash[:day_error] = "Please select a date"
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
end