class Horse < ApplicationRecord
    has_many :rides
    has_many :riders, through: :rides
    belongs_to :user
    validates_presence_of :owner
    validates :name, uniqueness: true, presence: true

end
