Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/parks', to: 'parks#index'
  get 'parks/:id', to: 'parks#show'
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
end
