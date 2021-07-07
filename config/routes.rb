Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/ski_brands', to: 'ski_brands#index'
  get '/ski_brands/:id', to: 'ski_brands#show'
  
end
