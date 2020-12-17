class CabsController < ApplicationController


    def create
        @cab = Cab.save(cab_params)
        if @cab.save
            render :json => @cab
        else
            render :json => {error: @cab.error_messages}, :status => :bad_request
        end
    end

    def bulk_onboard
        @cabs = Cab.insert_all(cabs_params)
        if @cabs.save
            render :json => @cabs
        else
            render :json => {error: @cabs.error_messages}, :status => :bad_request
        end
    end

    # takes location/city
    def book_ride
        @cab = Cab.nearest_available(params[:city_id])
        if @cab.book
            render :json => @cab
        else
            render :json => {error: @cab.error_messages}, :status => :bad_request
        end
    end

    def book
        @cab = Cab.find(params[:id])
        if @cab.book
            render :json => @cab
        else
            render :json => {error: @cab.error_messages}, :status => :bad_request
        end
    end

    def end_trip
        @cab = Cab.find(params[:id])
        if @cab.end_trip
            render :json => @cab
        else
            render :json => {error: @cab.error_messages}, :status => :bad_request
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
