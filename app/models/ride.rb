class Ride < ApplicationRecord
    belongs_to :horse
    belongs_to :rider
    belongs_to :user
    validates_presence_of :day, :time
    #accepts_nested_attributes_for :horse

    # def horse_attributes=(horse_attributes)
    #     horse = Horse.find_or_create_by(horse_attributes)
    #         ##I need to be able to assign user_id
    #         if horse.valid?
    #             self.horse = horse
    #         end
    # end

    def format_day_from_params(params)
        date_time = params[:ride][:time].to_datetime
        day = date_time.strftime("%-m/%d/%y")
    end

    def format_time_from_params(params)
        date_time = params[:ride][:time].to_datetime
        time = date_time.strftime("%I:%M:%S %p")
    end
end
