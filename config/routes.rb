Rails.application.routes.draw do
  get 'static_pages/home'
  get 'users/show'
  get 'signup'  => 'users#new'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get    'login'   => 'sessions#new'
  get 'index' => 'users#index'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'details' => 'users#details'
  get 'search' => 'users#search'
  get '*path' => redirect('/')
  resources :users
  root "users#index"
end
