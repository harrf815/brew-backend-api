Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feed_backs
      resources :breweries
      resources :users
      post '/login', to: 'auth#login'
      post '/signup', to: 'users#create'
      get "/current_user", to: "auth#show"

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
