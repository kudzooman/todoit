class ListsController < ApplicationController
  def index
    @list = List.find params[:id]
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_index_path
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
