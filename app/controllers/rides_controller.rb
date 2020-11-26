class RidesController < ApplicationController
    def new
        @ride = Ride.new
        @user = User.find_by(id: session[:user_id])
    end

    def create
        @ride = Ride.create(ride_params)
        
        redirect_to ride_path(@ride)
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