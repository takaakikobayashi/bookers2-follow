Rails.application.routes.draw do
	get 'home/about' => "home#about"
	root to: 'home#top'
	devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
end