class TodosController < ApplicationController

  def index
    @todo = Todo.new
    @todos = Todo.all

    respond_to do |format|
      format.html { @todo; @todos }
      format.json { render json: @todos }
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to do |format|
        format.html { redirect_to todos_path }
        format.json { render json: @todo }
      end
    else
      respond_to do |format|
        format.html { render @todo.errors }
        format.json { render json: @todo.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:task)
  end
end