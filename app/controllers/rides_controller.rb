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
        rider = Rider.find(params[:rider_id])
        ride = rider.rides.build(ride_params)
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
        params.require(:ride).permit(:notes, :time, :rider_id, :horse_id, :day, :horse_attributes => [:id, :name, :owner])
    end
end