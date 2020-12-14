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
end