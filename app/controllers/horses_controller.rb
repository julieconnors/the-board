class HorsesController < ApplicationController
    def new

    end

    def create

    end

    def show
        @horse = Horse.find(params[:id])
    end
end