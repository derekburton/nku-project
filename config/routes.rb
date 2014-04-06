NkuProject::Application.routes.draw do

  get "sessions/new"
  resources :coasters
  resources :users
  
  get "coasters/index"
  post 'sessions/new', to: "sessions#create", as: :signin
  get 'sessions/logout', to: "sessions#destroy", as: :logout_session
  
  root "coasters#index" 
  
end
