RentACar::Application.routes.draw do
  devise_for :users
	resources :cars
	resources :rentings, except: [:edit, :update]

	root to: 'cars#index'
end
