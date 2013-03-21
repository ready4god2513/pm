Nomadpm::Application.routes.draw do

  constraints(Subdomain) do
    namespace :api do
      namespace :v1, format: :json do
        resources :stories do
          resources :comments
          resources :tasks
          resources :attachment
          resources :labels
        end
        
        resources :users
        resources :story_types
        resources :states
      end
    end
  end
  
  root to: "home#start"
  
end