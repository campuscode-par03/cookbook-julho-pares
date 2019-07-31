Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes do 
    post 'send_message'
  end
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
  resources :lists, only: %i[index show]
  get 'search', to: 'recipes#search'
  get '/profile', to: 'users#profile'

end
