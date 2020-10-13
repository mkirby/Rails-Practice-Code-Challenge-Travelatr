class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end 
    def show
        @destinations = Destination.all

        @destination = Destination.find(params[:id])
    end 


end
