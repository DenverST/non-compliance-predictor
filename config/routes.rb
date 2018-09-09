Rails.application.routes.draw do
  # root to: 'pages#home'
  get '/map', to: 'pages#map', as: :map
  resources :debtors
  get '/help', to: 'pages#help', as: :help
  root to: 'debtors#current', as: :current
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
