Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#show'

  post '/users', to: 'users#create'
  get '/register', to: 'users#new'
  get '/favorites/:user_id', to: 'favorites#index', as: '/favorites'

  post '/sessions', to: 'sessions#create'
  get '/login', to: 'sessions#new'

  get '/recipes', to: 'recipes#index'

  get '/country/:name', to: 'country#show'
end
