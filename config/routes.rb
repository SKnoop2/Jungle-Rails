Rails.application.routes.draw do

  # login routes to render form, login and logout
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  # signup routes: First renders form in browser, second captures form info & creates user in database
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  
  root to: 'products#index'
  
  resources :about, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  
end
