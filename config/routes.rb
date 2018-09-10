Rails.application.routes.draw do
  resources :users
  root 'speak#index'
  post '/speak', to: 'speak#speak'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
