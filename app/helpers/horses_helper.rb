module HorsesHelper
    def horse_validation(horse)
        if horse.valid?
            horse.save

            redirect_to horses_path
        else
            horse_error_generator(horse)

            redirect_to horses_path
        end
    end

    def edit_horse_validation(horse)
        if horse.valid?
            horse.save

            redirect_to horses_path
        else
            horse_error_generator(horse)

            render :edit
        end
    end

    def horse_error_generator(horse)
        if horse.name == ""
            flash[:name_error] = "Please add horse name"
        end
        if horse.owner == ""
            flash[:owner_error] = "Please add owner name"
        end
    end

    def sort_horse_rides
        #self.
    end
end