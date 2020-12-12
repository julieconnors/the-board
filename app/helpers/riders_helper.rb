module RidersHelper
    def rider_validation(rider)
        if rider.valid?
            rider.save

            redirect_to riders_path
        else
            flash[:error] = "Please add a rider name"

            redirect_to riders_path
        end
    end

    def edit_rider_validation(rider)
        if rider.valid?
            rider.save

            redirect_to rider_path(rider)
        else
            @rider = rider
            flash[:error] = "Please add a rider name"

            render :edit
        end
    end
end
