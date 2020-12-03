module RidesHelper
    def ride_validation(ride)
        if ride.valid?
            ride.save

            redirect_to rider_ride_path(ride.rider_id)
        else
            error_generator(ride)

            redirect_to new_rider_ride_path(ride.rider_id)  #is looking for partial?
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
end