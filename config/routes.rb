NkuProject::Application.routes.draw do

  get "sessions/new"
  resources :coasters
  
  get "coasters/index"
  
  root "coasters#index" 
  
end
