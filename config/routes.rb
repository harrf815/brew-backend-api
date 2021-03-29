Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :feed_backs
      resources :breweries
      resources :users
      post '/login', to: 'users#login'
      get "/current_user", to: "users#get_user"

    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
