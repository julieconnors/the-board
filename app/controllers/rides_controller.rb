class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        #raise params.inspect
        @ride = Ride.new(ride_params)
        @ride.rider_id = params[:rider_id]

        @ride.save
        
        render :show
        #redirect_to rider_ride_path(@ride.rider_id)
    end

    def show
        @user = User.find(session[:user_id]) #refactor to current_user method
        @ride = Ride.find_by(id: params[:id])
    end

    private

    def ride_params
        params.require(:ride).permit(:location, :notes, :time, :rider_id, :horse_id)
    end
end