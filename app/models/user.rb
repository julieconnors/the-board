class User < ApplicationRecord
    has_secure_password

    # def rider_or_owner
    #     if params[:rider] == 1
    #         rider
    #     end
    # end
end
