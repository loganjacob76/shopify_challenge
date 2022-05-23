Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'beers#index'
  
  resources :beers
  get '/deleted', to: 'beers#deleted'
end
