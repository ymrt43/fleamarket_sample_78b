Rails.application.routes.draw do
  # devise_for :users, skip: :all
  # devise_scope :user do
  #   get "/sign_up" => "users/registrations#new", as: :new_user_registration
  #   post "/sign_up" => "users/registrations#create", as: :user_registration
  #   get "/sign_in" => "users/sessions#new", as: :new_users_sign_in
  #   post "/sign_in" => "users/sessions#create", as: :users_sign_in
  # end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  root 'items#index'
  resources :users, only: [:index, :edit]
  resources :cards, only: [:new, :show, :destroy]
  resources :items
  get 'items_buy', to: 'items#buy'
  resources :profiles, only: [:index, :new, :post, :create]
end
