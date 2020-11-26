class RidesController < ApplicationController
    def new
        @ride = Ride.new
        @horse = Horse.new
        @rider = Rider.new
    end

    def create
        #raise params.inspect
        @ride = Ride.create(ride_params)

        redirect_to ride_path(@ride)
    end

    private

    def ride_params
        params.require(:ride).permit(:location, :notes, :time, :rider_id, :horse_id)
    end
end