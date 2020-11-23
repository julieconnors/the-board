class RidersController < ApplicationController

    def new
        @rider = Rider.new
        #raise params.inspect
    end

    def create
        @rider = Rider.create(rider_params)
        #raise params.inspect
        byebug
    end

    def show
        #raise params.inspect
    end

    private

    def rider_params
        params.require(:rider).permit(:name)
    end
end
