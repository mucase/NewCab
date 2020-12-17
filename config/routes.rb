Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cabs do 
    member do
      post :book
      post :end_trip
      post :update_city
    end

    collection do 
      post :bulk_onboard
    end
  end
end
