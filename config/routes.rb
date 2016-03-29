Rails.application.routes.draw do
  resources :products
  resources :charges
  devise_for :users
  root to: "products#index"
  post "/charges/new", to: "charges#create"
end
