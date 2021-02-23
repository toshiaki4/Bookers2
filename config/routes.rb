Rails.application.routes.draw do
  get 'home/about' => "home#about"
  devise_for :users
  root to: 'home#top'
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end