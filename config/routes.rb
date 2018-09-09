Rails.application.routes.draw do
  # root to: 'pages#home'
  get '/map', to: 'pages#map', as: :map
  resources :debtors
  get '/help', to: 'pages#help', as: :help
  root to: 'pages#home', as: :home
  get '/compliance_risk_app_1', to: 'pages#compliance_risk_maps'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
