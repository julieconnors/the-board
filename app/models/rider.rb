class Rider < ApplicationRecord
    belongs_to :user
    has_many :rides
    has_many :horses, through: :rides
    validates :name, uniqueness: true, presence: true

end
