Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  root 'items#index'
  resources :users, only: [:index, :edit]

  resources :profiles, only: [:index, :new, :post, :create]
  resources :cards, only: [:new, :create, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
  resources :items do
    collection do
      get :search, defaults: { format: 'json' }
    end
    resources :buyers, only: [:index] do
      collection do
        post 'pay', to: 'buyers#pay'
        get 'done', to: 'buyers#done'
      end
    end
  end
end
