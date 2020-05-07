Rails.application.routes.draw do
  devise_for :users, controllers:{
  	sessions:  'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  resources :users, only: [:index,:show,:update,:edit]

  resources :books
  root to: 'home#top'
  get 'users/info'
  get 'home/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
