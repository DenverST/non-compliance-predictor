Rails.application.routes.draw do
  # root to: 'pages#home'
  get '/map', to: 'pages#map', as: :map
  resources :debtors
  get '/help', to: 'pages#help', as: :help
  root to: 'pages#home', as: :home
  get '/compliance_risk_app_1', to: 'pages#compliance_risk_maps_1'
  get '/compliance_risk_app_2', to: 'pages#compliance_risk_maps_2'
  get '/compliance_risk_app_3', to: 'pages#compliance_risk_maps_3'
  get '/compliance_risk_app_4', to: 'pages#compliance_risk_maps_4'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
