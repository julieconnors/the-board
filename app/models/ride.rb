class Ride < ApplicationRecord
    belongs_to :horse
    belongs_to :rider
    belongs_to :user
    validates_presence_of :day, :time
    #accepts_nested_attributes_for :horse
    
    def format_date
        self.day.strftime('%-m/%d/%y')
    end

    def format_time
        self.time.strftime('%l:%M %p')
    end

    # def horse_attributes=(horse_attributes)
    #     horse = Horse.find_or_create_by(horse_attributes)
    #         ##I need to be able to assign user_id
    #         if horse.valid?
    #             self.horse = horse
    #         end
    # end
end
