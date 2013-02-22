class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :auth

  def auth
    redirect_to new_user_path unless session[:user]
  end
end
