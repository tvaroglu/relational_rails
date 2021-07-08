Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/regions', to: 'regions#index'
  get '/regions/:id', to: 'regions#show'

  get '/resorts', to: 'resorts#index'
  get '/resorts/:id', to: 'resorts#show'
end
