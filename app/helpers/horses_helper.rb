module HorsesHelper
    def horse_validation(horse)
        if horse.valid?
            horse.save

            redirect_to horse_path(horse)
        else
            horse_error_generator(horse)

            render :new
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
end