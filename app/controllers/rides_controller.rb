class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @rider = Rider.find(params[:rider_id])
        @ride = @rider.rides.build(ride_params)
        @ride.save
        
        redirect_to rider_ride_path(@ride.rider_id, @ride)
    end

    def show
        @user = User.find(session[:user_id]) #refactor to current_user method
        @ride = Ride.find_by(id: params[:id])
    end

    private

    def ride_params
        params.require(:ride).permit(:location, :notes, :time, :rider_id, :horse_id, :day)
    end
end