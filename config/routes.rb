Rails.application.routes.draw do
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
  resources :profiles, only: [:index, :new, :post, :create]
  resources :cards, only: [:new, :show, :destroy]
  resources :items do
    collection do
      get :search
    end
  end
  get 'items_buy', to: 'items#buy'
end
