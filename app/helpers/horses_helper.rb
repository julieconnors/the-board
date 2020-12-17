module HorsesHelper
    def horse_validation(horse)
        if horse.valid?
            horse.save

            redirect_to horses_path
        else
            render :new
        end
    end

    def edit_horse_validation(horse)
        if horse.valid?
            horse.save

            redirect_to horses_path
        else
            render :edit
        end
    end

    def horse_ride_calendar
        raise params.inspect
        if params[:day] == nil
            @rides = ""
        else
            #@rides = .rides.where("day = ?", params[:day])
        end
    end
end