class Horse < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides
    belongs_to :user
    validates_presence_of :owner
    validates :name, uniqueness: true, presence: true
    validates :nickname, uniqueness: true, presence: true

    # def horse_validation
    #     if self.valid?
    #         self.save

    #         redirect_to horses_path
    #     else
    #         render :new
    #     end
    # end
    
    # def edit_horse_validation
    #     if self.valid?
    #         self.save

    #         redirect_to horses_path
    #     else
    #         render :edit
    #     end
    # end
    
end
