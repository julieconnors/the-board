class RidersController < ApplicationController

    def new
        @rider = Rider.new
    end

    def create
        #raise params.inspect

        user = User.find_by(id: session[:user_id])
        #@rider = Rider.create(rider_params)
        @rider = user.riders.build(rider_params)
        @rider.save

        redirect_to user_path(user)
    end

    def show
        @rider = Rider.find(params[:id])
    end

    private

    def rider_params
        params.require(:rider).permit(:name)
    end
end
