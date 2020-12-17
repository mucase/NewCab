class CabsController < ApplicationController


    def create
        @cab = Cab.new(cab_params)
        if @cab.save
            render :json => @cab
        else
            render :json => {error: @cab.errors.full_messages}, :status => :bad_request
        end
    end

    def bulk_onboard
        @cabs = Cab.create(cabs_params[:cabs])
        if @cabs
            render :json => @cabs
        else
            render :json => {error: @cabs.errors.full_messages}, :status => :bad_request
        end
    end

    # takes location/city
    def book_ride
        @cab = Cab.nearest_available(params[:city_id])
        if @cab
            @cab.book
            render :json => @cab
        else
            render :json => {error: "No Available Cabs in your area"}, :status => :not_found
        end
    end

    def update_city
        @cab = Cab.find(params[:city_id])
        if @cab.update(city_id: params[:new_city_id])
            render :json => @cab
        else
            render :json => {error: @cab.errors.full_messages}, :status => :bad_request
        end
    end

    def book
        @cab = Cab.find(params[:id])
        if @cab.book
            render :json => @cab
        else
            render :json => {error: @cab.errors.full_messages}, :status => :bad_request
        end
    end

    def end_trip
        @cab = Cab.find(params[:id])
        if @cab.end_trip
            render :json => @cab
        else
            render :json => {error: @cab.errors.full_messages}, :status => :bad_request
        end
    end

    private

    def cab_params
        params.require(:cab).permit(:number, :city_id, :state)
    end

    def cabs_params
        params.permit(
            cabs: [ :number, :city_id, :state]
        )
    end
end
