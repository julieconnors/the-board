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

    def edit
        @horse = Horse.find_by(id: params[:id])
    end

    def update
        @horse = Horse.find_by(id: params[:id])
        @horse.update(name: params[:horse][:name], owner: params[:horse][:owner])
    
        edit_horse_validation(@horse)
        #redirect_to horses_path
    end

    def show
        @horse = Horse.find(params[:id])
    end

    def destroy
        Horse.destroy(params[:id])

        redirect_to horses_path
    end

    private

    def horse_params
        params.require(:horse).permit(:name, :owner)
    end
end