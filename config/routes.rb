Nomadpm::Application.routes.draw do

  constraints(Subdomain) do
    namespace :api do
      namespace :v1 do
        resources :project do
          resources :iterations
          resources :integrations
          resources :users
          
          resources :labels
          resources :story_types
          resources :states
          resources :teams

          resources :stories do
            resources :notes
            resources :tasks
            resources :attachment
          end
        end
      end
    end
  end
  
  root to: "home#start"
  
end