require 'rails_helper'

feature 'Search a recipe' do
  
  
  scenario 'return exact name' do
    user = User.create(email: 'fulano@gmail.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                  user: user)

                  visit root_path
    fill_in 'Nome da Receita', with: 'Bolodecenoura'
    click_on 'Buscar'

    expect(current_path).to eq search_path
    expect(page).to have_content(recipe.title)
  end

  scenario 'did not find exact name' do

    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    fill_in 'Nome da Receita', with: 'Bolodeabacaxi'
    click_on 'Buscar'

    expect(page).not_to have_content(recipe.title)
    expect(page).to have_content('Nenhum resultado foi encontrado')
  end

  scenario 'parcial recipe name returns all alike' do
    user = User.create(email: 'fulano@gmail.com', password: '123456')
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                  user: user)
    recipe_two = Recipe.create(title: 'Bolodeabacaxi', difficulty: 'Médio',
                          recipe_type: recipe_type, cuisine: cuisine,
                          cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          user: user)

                  
    visit root_path
    fill_in 'Nome da Receita', with: 'Bolo'
    click_on 'Buscar'
    
    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe_two.title)
  end

end