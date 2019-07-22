class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)
    return redirect_to @recipe_type if @recipe_type.save

    render :new
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end
end
