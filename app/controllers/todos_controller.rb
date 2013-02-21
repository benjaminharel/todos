class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json

  before_filter do
    @user = User.find(session[:user])
  end


  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = @user.todos.new
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
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

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    begin
      @todo.update_attributes!(params[:todo])
      flash[:notice] = "Todo was updated"
    rescue
      flash[:error] = "Title is empty"
    end
    render :action => :create
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo was deleted"
    render :action => :create
  end

  def move_up
    Todo.find(params[:todo_id]).move_higher
    render :action => :create
  end

  def move_down
    Todo.find(params[:todo_id]).move_lower
    render :action => :create
  end
end
