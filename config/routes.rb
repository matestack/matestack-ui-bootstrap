Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  root to: 'dummy/dashboard#show'

  namespace :dummy do
    get :dashboard, to: 'dashboard#show'
    resources :customers
    resources :products
    resources :orders
    resources :order_items
  end

end
