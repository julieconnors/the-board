class RidesController < ApplicationController
    include RidesHelper
    before_action :logged_out_redirection

    def index        
        @rider = Rider.find_by(id: params[:rider_id])
    end

    def new
        @ride = Ride.new
    end

    def create
        ride_params[:time] = ride_params[:time].split(" ")[1]
        ride = Ride.new(ride_params)
        ride.user_id = current_user.id

        ride_validation(ride)
    end

    def show
        @ride = Ride.find_by(id: params[:id])
    end

    def edit
        @ride = Ride.find_by(id: params[:id])
    end

    def update
        ride = Ride.find(params[:id])
        ride.update(day: params[:ride][:day], time: params[:ride][:time], notes: params[:ride][:notes])

        update_ride_validation(ride)
    end

    def destroy
        Ride.destroy(params[:id])

        redirect_to user_path(current_user)
    end

    private

    def ride_params
        params.require(:ride).permit(:notes, :rider_id, :horse_id, :time, :day)
    end
end