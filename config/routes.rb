Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
  get 'search', to: 'recipes#search'
end
