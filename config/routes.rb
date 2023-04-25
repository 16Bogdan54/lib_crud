Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :user_records
  resources :users
  resources :genres
  resources :libraries
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
