module RidersHelper

    def todays_rider_rides(rider)
        rider.rides.where("day = ?", Date.today).order(:time)
    end

    def sort_rider_rides(rider)
        rider.rides.order(:day).order(:time)
    end

    def rider_validation(rider)
        if rider.valid?
            rider.save

            redirect_to rider_path(rider)
        else
            render :new
        end
    end

    def edit_rider_validation(rider)
        if rider.valid?
            rider.save

            redirect_to rider_path(rider)
        else
            render :edit
        end
    end
end
