Rails.application.routes.draw do
  devise_for :users
  get "splashes/index"

  resources :groups
  resources :entities

  unauthenticated do
    root "splashes#index"
  end

  authenticated do
    root "groups#index", as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
