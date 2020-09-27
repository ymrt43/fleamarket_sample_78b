Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_up" => "users/registrations#new", as: :new_user_registration
    get "/sign_in" => "users/sessions#new", as: :user_session
  end
  devise_for :users

  root 'items#index'
  resources :users, only: [:index, :edit] 
  resources :cards, only: [:new, :show, :destroy] 
  resources :items, only: [:index, :new, :show]
  get 'items_buy', to: 'items#buy'
  resources :profiles, only: [:index, :new, :post, :create]

end
