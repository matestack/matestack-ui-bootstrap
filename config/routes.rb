Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bootstrap#home'
  get '/form', to: 'bootstrap#form', as: :form
  post '/test_form', to: 'bootstrap#test_form', as: :form_test
end
