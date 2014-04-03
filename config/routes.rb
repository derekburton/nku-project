NkuProject::Application.routes.draw do

  resources :coasters
  
  get "coasters/index"
  
  root "coasters#index" 
  
end
