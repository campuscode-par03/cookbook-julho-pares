class RecipesMailer < ApplicationMailer
  def send_recipe(recipe_id, author, to, message)
    @recipe = Recipe.find(recipe_id)
    @author = author
    @message = message
    mail(to: to, subject: message)

  end
end