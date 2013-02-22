class TodosController < ApplicationController
  before_filter do
    @user = User.find(session[:user])
  end

  def new
    @todo = @user.todos.new
  end

  def edit
    @todo = @user.todos.find(params[:id])
  end

  def create
    begin
      todo = @user.todos.new(params[:todo])
      todo.position = Todo.maximum(:position)? Todo.maximum(:position) + 1 : 1
      todo.save!
      flash[:notice] = "Todo was created"
    rescue
      flash[:error] = "Title is empty"
    end
  end

  def update
    @todo = @user.todos.find(params[:id])
    begin
      @todo.update_attributes!(params[:todo])
      flash[:notice] = "Todo was updated"
    rescue
      flash[:error] = "Title is empty"
    end
    render :action => :create
  end

  def destroy
    @todo = @user.todos.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo was deleted"
    render :action => :create
  end

  def move_up
    @user.todos.find(params[:todo_id]).move_higher
    render :action => :create
  end

  def move_down
    @user.todos.find(params[:todo_id]).move_lower
    render :action => :create
  end
end
