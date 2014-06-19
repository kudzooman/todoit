class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def new
    @list = List.new user_id: current_user.id
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
  end

  def create
    @lists = List.new(list_params)
    if @lists.save
      flash[:notice] = "Great save!"
      redirect_to root_path
    else
      flash[:error] = "Nope."
      render :new
    end
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
