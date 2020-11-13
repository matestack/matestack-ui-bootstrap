Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bootstrap#home'
  get '/form', to: 'bootstrap#form', as: :form
  get '/collection', to: 'bootstrap#collection', as: :collection
  get '/test', to: 'bootstrap#test', as: :test
  get '/dashboard', to: 'bootstrap#dashboard', as: :dashboard
  post '/test_form', to: 'bootstrap#test_form', as: :form_test
end
