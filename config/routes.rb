RentACar::Application.routes.draw do
  resources :cars do
	  resources :bookings
	end
  devise_for :users 
  devise_scope :user do
  	authenticated :user do
    	root :to => "static_pages#home", as: :authenticated_root
  	end
  	unauthenticated :user do
   		root :to => 'devise/sessions#new', as: :unauthenticated_root
  	end
	end
	match "static_pages/search_results", to: "static_pages#search_results", via: "post"
end
