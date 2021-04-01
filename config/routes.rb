Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feed_backs do 
        resources :users do 
          resources :breweries
        end
      end
      resources :breweries
      resources :users
      post '/login', to: 'auth#login'
      post '/signup', to: 'users#create'
      get '/getuser', to: 'users#getuser'
      get '/washington', to: 'breweries#washington'
      get '/states', to: 'breweries#states'
      # match '/feed_backs/breweries/'
      
    end
  end
end
