class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @rider = Rider.find_by(id: params[:rider_id])
        @ride = @rider.rides.build(ride_params)
        @ride.save
        
        redirect_to rider_ride_path(@ride.rider_id, @ride)
    end

    def show
        @rider = Rider.find_by(id: params[:rider_id])
        @ride = Ride.find_by(id: params[:id])
    end

    private

    def ride_params
        params.require(:ride).permit(:location, :notes, :time, :rider_id, :horse_id, :day)
    end
end