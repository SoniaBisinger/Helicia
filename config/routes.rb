Rails.application.routes.draw do
  devise_for :users

  root to: 'stores#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "articles#index"
  resources :stores
  resources :articles, only: [:show]

  resources :orders do
    member do
      get :checkout
      get :confirmation
    end
  end
  post 'orders/add'
  post 'orders/remove'
  resources :articles do
    resources :article_orders, only: [:create]
  end
end
