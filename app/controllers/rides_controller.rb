class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @rider = Rider.find_by(id: params[:rider_id])
        @ride = @rider.rides.build(ride_params)
        @ride.user_id = helpers.current_user.id
        if @ride.ride_validation
            redirect_to rider_ride_path(@ride.rider_id, @ride)            
        else
            helpers.error_generator(@ride)
            render :new            
        end
    end

    def show
        @rider = Rider.find_by(id: params[:rider_id])
        @ride = Ride.find_by(id: params[:id])
    end

    def edit
        @ride = Ride.find_by(params[:id])
    end

    def update
        raise params.inspect


    end

    def destroy
        #I need to find a way to find a ride by rider and ride id
        #ride = Ride.where("rider_id = ? AND id = ?", params[:rider_id], params[:id])
        
        raise params.inspect

        #redirect_to user_path(current_user)
    end

    private

    def ride_params
        params.require(:ride).permit(:location, :notes, :time, :rider_id, :horse_id, :day)
    end
end