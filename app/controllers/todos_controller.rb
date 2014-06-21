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

    if @todo.save
      flash[:notice] = "Todo saved"
    else
      flash[:error] = "Nope"
    end
  end

    respond_with(@list.todos) do |f|
      f.html { redirect_to @list.todos }
  end

  def destroy
    @list = List.find(params[:list_id])

    @todo = @todo.find(params[:id])

    if @todo.destroy
      flash[:notice] = "Guess that's done"
    else
      flash[:error] = "Nope"
    end

    respond_with(@todo) do |f|
      f.html { redirect_to @list.todos }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:completed, :item, :list)
  end


end
