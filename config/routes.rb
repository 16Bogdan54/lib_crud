Rails.application.routes.draw do
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
