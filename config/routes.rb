RentACar::Application.routes.draw do
resources :cars
resources :rentings, except: [:edit, :update]

root to: 'cars#index'
end
