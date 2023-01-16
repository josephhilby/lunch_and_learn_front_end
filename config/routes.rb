Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#show'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/recipes', to: 'recipes#index'
  get '/country/:id', to: 'country#show'
  get '/favorites', to: 'favorites#index'
end
