class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
  end

  def create
    @lists = List.new(list_params)
    if @lists.save
      flash[:notice] = "Great save!"
      redirect_to @lists
    else
      flash[:error] = "Nope."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    redirect_to lists_path
  end

  def destroy
    @lists = List.find(params[:id])
    name = @list
    if @lists.destroy
      flash[:notice] = "\"#{name}\" is gone forever."
    else
      flash[:error] = "Something went wrong. Try again."
      render :show
    end
    redirect_to @lists
  end

  private

  def list_params
    params.require(:list).permit(:todo, :name)
  end
end
