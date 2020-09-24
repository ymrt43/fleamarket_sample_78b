Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :edit] 
  resources :cards, only: [:new, :show, :destroy] 
  resources :items, only: [:index, :new]
  get 'items_buy', to: 'items#buy'
end
