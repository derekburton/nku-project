NkuProject::Application.routes.draw do

  get "sessions/new"
  resources :coasters do
    resources :reviews
  end
  resources :users
  resources :reviews
  
  get "coasters/index"
  post 'sessions/new', to: "sessions#create", as: :signin
  get 'sessions/logout', to: "sessions#destroy", as: :logout_session
  
  root "coasters#index" 
  
end
