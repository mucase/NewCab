class CitiesController < ApplicationController

    def create
        @city = City.new(city_params)
        if @city.save
            render :json => @city
        else
            render :json => {error: @city.errors.full_messages}, :status => :bad_request
        end
    end

    private

    def city_params
        params.require(:city).permit(:name)
    end
end
