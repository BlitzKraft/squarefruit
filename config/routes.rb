Rails.application.routes.draw do
  get 'uploads/new'

  get 'uploads/create'

  get 'uploads/index'

  resources :products
  resources :uploads
  devise_for :users
  root to: "welcome#index"
end
