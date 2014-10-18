Rails.application.routes.draw do
	
  devise_for :users
  resources :lists do
	  resources :tasks
	end
	resources :public_lists, only: :index

  root 'lists#index' 
end
