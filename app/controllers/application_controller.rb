class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter do
    # redirect_to new_user_path unless session[:user] unless :controller == :users && :action == :new
  end
end
