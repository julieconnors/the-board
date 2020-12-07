module RidersHelper
    def rider_validation(rider)
        if rider.valid?
            rider.save
        else
            flash[:error] = "Please add a name"
        end
    end

    def edit_rider_validation(rider)
        if rider.valid?
            rider.save

            redirect_to rider_path(rider)
        else
            @rider = rider
            flash[:error] = "Please add a name"

            render :edit
        end
    end
end
