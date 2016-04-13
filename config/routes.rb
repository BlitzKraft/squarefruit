Rails.application.routes.draw do
  resources :products
  resources :charges
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: "registrations" } 
  root to: "products#index"
  post "/charges/new", to: "charges#create"
  
end
