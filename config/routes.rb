Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cabs do 
    member do
      post :book
      post :end_trip
      patch :update_city
    end

    collection do 
      post :bulk_onboard
      post :book_ride
    end
  end
  resources :cities, only: [:create]
end
