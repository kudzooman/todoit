class TodosController < ApplicationController
  respond_to :html, :js

  def new
    @list = List.find(params[:list_id])
    @todos = Todo.new
  end

  def create
    @list = List.find(params[:list_id])

   @todo = current_user.todos.build(todo_params)
   @todo.list = @todo
   @new_todo.list = Todo.new

    @todo.save
    redirect_to @list.todos.item
    
  end

    #respond_with(@list.todos) do |f|
     # f.html { redirect_to @list.todos }
  #end

  def destroy
    @list = List.find(params[:list_id])

    @todo = @todo.find(params[:id])

    @todo.destroy
    redirect_to @list.todos.item
  end

  private

  def todo_params
    params.require(:todo).permit(:completed, :item, :list)
  end


end
