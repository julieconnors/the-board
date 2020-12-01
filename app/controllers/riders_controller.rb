class RidersController < ApplicationController

    def new
        @rider = Rider.new
    end

    def create
        rider = current_user.riders.build(rider_params)
        helpers.rider_validation(rider)

        redirect_to user_path(current_user)
    end

    def show
        @rider = Rider.find(params[:id])
    end

    private

    def rider_params
        params.require(:rider).permit(:name)
    end
end
