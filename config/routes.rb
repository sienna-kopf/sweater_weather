Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#show'
      get '/climbing_routes', to: 'routes#index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
