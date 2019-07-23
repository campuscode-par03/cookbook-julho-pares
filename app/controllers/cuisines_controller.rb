class CuisinesController < ApplicationController
  
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    flash[:alert] = 'Cozinha cadastrada com sucesso'
    return redirect_to @cuisine if @cuisine.save
    
    render :new
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  private 
  
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end