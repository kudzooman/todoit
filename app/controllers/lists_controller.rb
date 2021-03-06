class ListsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @lists = policy_scope(List)
  end

  def new
    @list = List.new
    authorize @list
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
  end

  def create
    @list = current_user.lists.create(list_params)
    if @list.save
      flash[:notice] = "Great save!"
      redirect_to @list
    else
      flash[:error] = "Nope."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(list_params)
    authorize @list
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
    authorize @list
    redirect_to @lists
  end

  private

  def list_params
    params.require(:list).permit(:todo, :name)
  end
end
