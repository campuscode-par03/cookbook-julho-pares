class RemoveCuisineRecipeTypeFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :cuisine, :string
    remove_column :recipes, :recipe_type, :string
  end
end
