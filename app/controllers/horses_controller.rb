class HorsesController < ApplicationController
    include HorsesHelper

    def index
    end

    def new
    end

    def create
        horse = current_user.horses.build(horse_params)
        
        horse_validation(horse)
    end

    def show
        @horse = Horse.find(params[:id])
    end

    private

    def horse_params
        params.require(:horse).permit(:name, :owner)
    end
end