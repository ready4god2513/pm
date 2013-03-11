Nomadpm::Application.routes.draw do
  
  resources :teams


  namespace :api do
    resources :project do
      resources :attachment
      resources :iterations
      resources :integrations
      resources :users
      
      resources :stories do
        resources :tasks
      end
    end
    
  end
end