Rails.application.routes.draw do
  get 'tags/index'

  get 'tags/show'

  get 'sessions/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :tasks do
      patch '/complete', to: 'tasks#complete'
      patch '/undocomplete', to: 'tasks#undo_complete'
    end
  end
  resources :tags, only: [:index, :show]
end
