class Cab < ApplicationRecord

    belongs_to :city
    
    before_create :set_initial_status

    state_machine initial: :idle do

        before_transition from: :on_trip, to: :idle, do: :update_transition_time

        event :book  do 
            transition :idle => :on_trip
        end

        event :end_trip do
            transition :on_trip => :idle
        end

    end

    def update_transition_time
        self.transition_at = Time.now
    end

    def set_initial_status
        update_transition_time
    end

    def nearest_available(city_id)
        Cab.where(city_id: '', state: 'idle')
            .order(transition_at: :desc)
            .first
    end


end
