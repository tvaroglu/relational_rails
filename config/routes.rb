Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:park_id/trails', to: 'park_trails#index'
  post '/parks', to: 'parks#create'

  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

  get '/regions', to: 'regions#index'
  get '/regions/new', to: 'regions#new'
  get '/regions/:id', to: 'regions#show'
  get '/regions/:id/edit', to: 'regions#edit'
  post '/regions', to: 'regions#create'
  patch '/regions/:id/edit', to: 'regions#update'
  get '/regions/:id/resorts', to: 'regions#resorts'

  get '/resorts', to: 'resorts#index'
  get '/resorts/:id', to: 'resorts#show'

  get '/ski_brands', to: 'ski_brands#index'
  get 'ski_brands/new', to: 'ski_brands#new'
  post 'ski_brands', to: 'ski_brands#create'
  get '/ski_brands/:id', to: 'ski_brands#show'
  get 'ski_brands/:id/edit', to: 'ski_brands#edit', as: 'ski_brand_edit'
  patch 'ski_brands/:id', to: 'ski_brands#update'
  delete '/ski_brands/:id', to: 'ski_brands#delete'

  get '/skis', to: 'skis#index', as: 'ski_index'
  get 'skis/new', to: 'skis#new'
  post 'skis', to: 'skis#create'
  get '/skis/:id', to: 'skis#show'
  get 'skis/:id/edit', to: 'skis#edit'
  patch 'skis/:id', to: 'skis#update'
  delete '/skis/:id', to: 'skis#delete'

  get 'ski_brands/:ski_brand_id/skis', to: 'ski_brand_skis#index', as: 'ski_brand_skis'
  get 'ski_brands/:ski_brand_id/skis/new', to: 'ski_brand_skis#new', as: 'ski_brand_skis_new'
  post 'ski_brands/:ski_brand_id/skis', to: 'ski_brand_skis#create'
  delete '/ski_brands/:ski_brand_id/skis/:ski_id', to: 'ski_brand_skis#delete'
end
