require 'rails_helper' 

feature 'User View Lists' do
  scenario 'only owner see' do
    
    user = User.create(email: 'fulando@gmail.com', password: '123321')
    othe_user = User.create(email: 'cicrano@gmail.com', password: '123321')
    
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
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
                           user: othe_user)
    list = List.create(name: 'Lista de carnaval', user: user)
    other_list = List.create(name: 'Lista de Churrasco', user: othe_user)
    ListRecipe.create(recipe: recipe, list: list)

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123321'
    click_on 'Logar'
    click_on 'Minhas Listas'
    click_on 'Lista de carnaval'

    expect(page).to_not have_content('Lista de churrasco')
    expect(page).to have_content('Lista de carnaval')
    expect(page).to have_content('Bolo de cenoura')

  end
end