Rails.application.routes.draw do
  resources :users do
    member do
      get 'sound_for'
    end
  end
  root 'speak#index'
  post '/speak', to: 'speak#speak'
  post '/bonus', to: 'speak#bonus'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
