class HorsesController < ApplicationController
    
    def index
    end

    def new
    end

    def create
        horse = current_user.horses.build(horse_params)
        horse.save

        redirect_to horse_path(horse)
    end

    def show
        @horse = Horse.find(params[:id])
    end

    private

    def horse_params
        params.require(:horse).permit(:name, :owner)
    end
end