Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feed_backs
      resources :breweries
      resources :users
      post '/login', to: 'auth#login'
      post '/signup', to: 'users#create'
      get '/getuser', to: 'users#getuser'
      get '/washington', to: 'breweries#washington'
      get '/states', to: 'breweries#states'
    end
  end
end
