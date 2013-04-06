Nomadpm::Application.routes.draw do
  
  

  devise_for :users

  constraints(Subdomain) do
    
    resources :stories do
      resources :comments
      resources :tasks
      resources :attachment
      resources :labels
    end
    
    resources :iterations
    resources :users
    resources :story_types
    resources :states
    
    namespace :api do
      namespace :v1, format: :json do
        resources :stories do
          resources :comments
          resources :tasks
          resources :attachment
          resources :labels
        end
        
        resources :iterations
        resources :users
        resources :story_types
        resources :states
      end
    end
    
    root to: "iterations#index"
  end
  
  resources :teams, only: [:create]
  root to: "home#start"
  
end