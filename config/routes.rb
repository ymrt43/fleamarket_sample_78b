Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_up" => "users/registrations#new", as: :new_user_registration
    post "/sign_up" => "users/registrations#create", as: :user_registration
    # get "/users/sign_in" => "users/sessions#new", as: :new_users_sign_in
    # post "/users/sign_in" => "users/sessions#create", as: :users_sign_in
   end
  devise_for :users

  root 'items#index'
  resources :users, only: [:index, :edit]
  resources :cards, only: [:new, :show, :destroy]
  resources :items
  get 'items_buy', to: 'items#buy'
  resources :profiles, only: [:index, :new, :post, :create]
end
