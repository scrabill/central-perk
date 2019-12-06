Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :menu_items
  resources :order_items

  resources :users do
    resources :orders
  end

  root 'static#home'

  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

end
