Nomadpm::Application.routes.draw do

  resources :teams


  namespace :api do
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