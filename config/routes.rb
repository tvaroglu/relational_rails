Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'

  get '/regions', to: 'regions#index'
  get '/regions/:id', to: 'regions#show'
  get '/regions/:id/resorts', to: 'regions#resorts'

  get '/resorts', to: 'resorts#index'
  get '/resorts/:id', to: 'resorts#show'
end
