class UsersController < ApplicationController

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.find_or_create_by_email params[:user][:email]
    session[:user] = @user.id
    redirect_to @user, notice: 'User ' + @user.email + ' is logged in.'
  end

  def logout
    session[:user] = nil

    redirect_to new_user_path, :notice => "Successfully logged out"
  end


 end
