Rails.application.routes.draw do
  resources :users
  root 'speak#index'
  post '/speak', to: 'speak#speak'
  post '/bonus', to: 'speak#bonus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
