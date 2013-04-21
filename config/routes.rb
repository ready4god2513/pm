Nomadpm::Application.routes.draw do
  
  

  devise_for :users

  constraints(Subdomain) do
    
    resources :projects do
      resources :stories do
        resources :comments
        resources :tasks
        resources :attachment
        resources :labels
      end
    end
    
    resources :stories, only: [:new, :create]
    resources :iterations
    resources :users
    resources :story_types, path: "story-types"
    resources :states
    
    root to: "iterations#index"
  end
  
  resources :teams, only: [:create]
  root to: "home#start"
  
end