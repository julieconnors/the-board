module HorsesHelper

    def horses_rides_today(horse)
        horse.rides.where("day = ?", Date.today).order(:time)
    end

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
end