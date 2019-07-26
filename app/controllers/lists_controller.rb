class ListsController < ApplicationController
  
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end
end