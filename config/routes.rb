RentACar::Application.routes.draw do
  resources :cars do
	  resources :bookings
	end
  devise_for :users
	root to: 'static_pages#home'
	match "static_pages/search_results", to: "static_pages#search_results", via: "post"
	
end
