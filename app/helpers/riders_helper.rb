module RidersHelper
    def rider_validation(rider)
        if rider.valid?
            rider.save
        else
            flash[:error] = "Please add a name"
        end
    end
end
