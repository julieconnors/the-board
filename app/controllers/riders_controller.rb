class RidersController < ApplicationController

    def new
        @rider = Rider.new
    end

    def create
        @rider = Rider.create(rider_params)
    end

    def show
        @rider = Rider.find(params[:id])
    end

    private

    def rider_params
        params.require(:rider).permit(:name)
    end
end
