class TodosController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @todos = @list.todos

    @todo = current_user.todos.build( todo_params )
    @todo.list = @todo
    @new_todo = Comment.new

    if @todo.save
    end
  end

    respond_with(@todo) do |f|
      f.html { redirect_to [@list] }
  end

  def destroy
    @list = List.find(params[:list_id])

    @todo = @comments.find(params[:id])

    if @todo.destroy
      flash[:notice] = "Guess that's done."
    else
      flash[:error] = "Nope."
    end

    respond_with(@todo) do |f|
      f.html { redirect_to [@list] }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:completed, :title, :list, :user, :todo)
  end


end
