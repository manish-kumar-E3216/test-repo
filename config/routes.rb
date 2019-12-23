Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  get 'signup'  => 'users#new'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'login'   => 'sessions#new'
  get 'index' => 'users#index'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'details' => 'users#details'
  get 'search' => 'users#search'
  get 'edit'  => 'account_activations#edit'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'order_food_items/:id/add' => "order_food_items#add_quantity", as: "order_food_item_add"
  post 'order_food_items/:id/reduce' => "order_food_items#reduce_quantity", as: "order_food_item_reduce"
  get 'order_food_items' => "order_food_items#create"
  get 'order_food_items/:id' => "order_food_items#show", as: "order_food_item"
  get 'order_food_items_new' =>"order_food_items#new"
  delete 'order_food_items/:id' => "order_food_items#destroy"
  resources :account_activations, only: [:edit]
  resources :users
  resources :orders
  root "users#index"
  get '*path' => redirect('/')
end
