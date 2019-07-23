Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
end
