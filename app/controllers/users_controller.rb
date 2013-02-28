class UsersController < ApplicationController
  skip_before_filter :auth, :only => [:new, :create]

  def show
    @user = User.find(session[:user])
  end

  def new
    @user = User.new
  end

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
