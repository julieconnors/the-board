module RidersHelper
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

    def has_riders
        if current_user.riders.empty?
            "Please add a rider"
        else
            ""
        end
    end
end
