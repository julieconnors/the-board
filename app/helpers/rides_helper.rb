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

    def rides_by_date
    #     if !@rides.empty?
    #          @rides.each do |ride|
    #             ride.name
    #          end
    #     end
    end
end