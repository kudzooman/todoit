class ListsController < ApplicationController
  def index
    @list = List.find params[:id]
  end

  def new
    @list = List.new
  end

  def create
    @lists = List.new(list_params)
    @lists.save
    redirect_to @lists
  end

  def edit
  end

  def update
  end

  private

  def list_params
    params.require(:list).permit(:todo, :YesorNo)
  end
  
end
