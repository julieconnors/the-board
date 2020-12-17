class RidersController < ApplicationController
    include RidersHelper
    before_action :logged_out_redirection

    def index
        @rider = Rider.find_by(id: params[:id])
    end

    def new
        @rider = Rider.new
    end

    def create
        @rider = current_user.riders.build(rider_params)
        
        rider_validation(@rider)
    end

    def show
        @rider = Rider.find_by(id: params[:id])
    end

    def edit
        @rider = Rider.find_by(id: params[:id])
    end

    def update
        rider = Rider.find_by(id: params[:id])
        rider.update(name: params[:rider][:name])
        
        edit_rider_validation(rider)
    end

    def destroy
        rider = Rider.find(params[:id])
        rider.rides.map{|ride| ride.destroy }
        Rider.destroy(params[:id])

        redirect_to riders_path
    end

    private

    def rider_params
        params.require(:rider).permit(:name)
    end
end
