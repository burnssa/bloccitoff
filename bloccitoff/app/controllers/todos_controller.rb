class TodosController < ApplicationController
  def index
    Rails.logger.info ">>>>>>>>>>>>> in todos controller"
    @todos = current_user.todos
    Rails.logger.info ">>>>>>>>>>>>>> #{@todos.inspect}"
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      flash[:notice] = "Your todo has been created."
    else
      flash[:error] = "There was an error saving your todo. Please try again."
    end 
    redirect_to todos_path
  end

  # def edit
  #   @todo = current_user.todos.find_by_id(params[:id])
  # end

  def update
    @todo = current_user.todos.find_by_id(params[:id])
    if @quick_fact.update_attributes(params[:id])
      flash[:notice] = 'Todo was successfully updated.'
      redirect_to todos_path
    else
      render :action => "index", :id => params[:id]
    end
  end

  def destroy
    @todo = current_user.todos.find_by_id(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :complete)
  end
end
