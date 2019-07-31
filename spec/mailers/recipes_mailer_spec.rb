require 'rails_helper'

describe RecipesMailer do
  describe "#send_recipe" do
    it 'should send recipe' do 
      recipe_type = RecipeType.create(name: 'Sobremesa')
      RecipeType.create(name: 'Entrada')
      user = User.create(email: 'fulano@gmail.com', password: '123456')
      cuisine = Cuisine.create(name: 'Brasileira')
      Cuisine.create(name: 'Arabe')
      recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                    recipe_type: recipe_type, cuisine: cuisine,
                    cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                    cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes', user: user)
    
      mail = RecipesMailer.send_recipe(recipe.id, 'Renan', "mateus@gmail.com", "Olá, segue uma receita de #{recipe.title}")
    
      expect(mail.to).to include "mateus@gmail.com"
      expect(mail.body).to include "Olá, segue uma receita de #{recipe.title}"
      expect(mail.body).to include 'Renan te enviou uma receita'

    end 
  end 
end