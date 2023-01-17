Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#show'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/recipes', to: 'recipes#index'
  get '/country/:id', to: 'country#show'
  get '/favorites', to: 'favorites#index'
end
