Rails.application.routes.draw do
  get 'orders/create'

  devise_for :users
  root to: "pages#home"
  resources :locations
  resources :sellers, :only => :index
  resources :listings do
    resources :orders
  end
end
