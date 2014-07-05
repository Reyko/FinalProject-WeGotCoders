Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :locations
  resources :sellers, :only => :index
  resources :listings
end
