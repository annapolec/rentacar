RentACar::Application.routes.draw do
  resources :cars do
	  resources :bookings
	end
  devise_for :users
	

	root to: 'cars#index'
end
