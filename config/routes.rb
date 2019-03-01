Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'

  resources :users
  resources :projects
  resources :contacts

  get '/about', to: 'about#show'
  put '/about', to: 'about#update'
end
