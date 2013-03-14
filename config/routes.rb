Nomadpm::Application.routes.draw do

  resources :labels


  resources :story_types


  resources :states


  resources :teams


  constraints(Subdomain) do
    namespace :api do
      namespace :v1 do
        resources :project do
          resources :iterations
          resources :integrations
          resources :users

          resources :stories do
            resources :notes
            resources :tasks
            resources :attachment
          end
        end
      end
    end
  end
  
  root to: "ember#start"
  
end