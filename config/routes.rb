Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  post 'send_feedback', to: 'feedbacks#create'
  
  resources :products, only: [:show, :index] do 
    resources :comments
  end

  resource :cart, only: [:show] do
    post 'add/:product_id', to: 'carts#add', as: 'add_to'
    post 'remove/:product_id', to: 'carts#remove', as: 'remove_from'
    post 'increase_quantity/:product_id', to: 'carts#increase_quantity', as: 'increase_quantity'
    post 'decrease_quantity/:product_id', to: 'carts#decrease_quantity', as: 'decrease_quantity'
  end

  resources :orders, only: [:new, :create, :show, :index]

  namespace :admin do
    resources :products, except: [:show, :index]
    resources :comments, only: [:destroy]
  end
end
