Nomadpm::Application.routes.draw do
  
  resources :users


  resources :teams


  namespace :api do
    resources :project do
      resources :attachment
      resources :iterations
      resources :integrations
      resources :project_memberships
      
      resources :stories do
        resources :tasks
      end
    end
    
  end
end