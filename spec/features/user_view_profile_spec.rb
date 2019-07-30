require 'rails_helper'

feature 'user view profile' do 
  scenario 'successfuly' do

    # faz o login e cria a receita
    user = login 
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: user)
    Recipe.create(title: 'Bolo de abacaxi', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: user)

    # usuário visualiza perfil
    visit root_path
    click_on 'Perfil'

    expect(page).to have_content(user.email)
    expect(page).to have_content('Bolo de cenoura')
    expect(page).to have_content('Bolo de abacaxi')
    #expect(page).to have_link('Deletar Receita')

  end
end