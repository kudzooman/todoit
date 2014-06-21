class ListsController < ApplicationController

  def index
    @list = List.all

  end

  def new
    @list = List.new  
  end

  def show
    #@list = List.find(params[:list_id])
    @todos = @list
    @list = current_user.lists.find(params[:list_id])
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
    @list = List.find(params[:id])
  end

  def update
  end

  private

  def list_params
    params.require(:list).permit(:todo)
  end
  
end
