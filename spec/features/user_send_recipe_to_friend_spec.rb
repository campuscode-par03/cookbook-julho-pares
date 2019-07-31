require 'rails_helper' 

feature 'User send recipe to friend through email' do
  scenario 'successfully' do
    user = User.create(email: 'fulano@gmail.com', password: '123321')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: user)
    expect(RecipesMailer).to receive(:send_recipe).with(recipe.id, 'mateuscbraga@gmail.com', 
                                                                         'renan.maringolo@gmail.com',
                                                                         "Olá, segue uma receita de #{recipe.title}")
  
    visit root_path
    click_on 'Bolo de cenoura'
    fill_in 'De:', with: 'mateuscbraga@gmail.com'
    fill_in 'Para:', with: 'renan.maringolo@gmail.com'
    fill_in 'Mensagem', with: "Olá, segue uma receita de #{recipe.title}"
    click_on 'Enviar'

    
    expect(page).to have_content('E-mail enviado com sucesso!')

  end
end
