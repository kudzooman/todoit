class TodosController < ApplicationController
  respond_to :html, :js

  def new
    @list = List.find(params[:list_id])
    @todos = Todo.new
  end

  def create
    @list = List.find(params[:list_id])

    @todo = @list.todos.build(todo_params)
    @new_todo = Todo.new

    @todo.save!

    respond_with(@todo) do |f|
      f.html { redirect_to @list }
    end
  end

  def destroy
    @list = List.find(params[:list_id])

    @todo = @list.todos.find(params[:id])

    @todo.destroy
    redirect_to @list
  end

  private

  def todo_params
    params.require(:todo).permit(:completed, :item, :list)
  end


end
