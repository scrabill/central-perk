Rails.application.routes.draw do
  resources :menu_items
  resources :order_items

  resources :users do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
