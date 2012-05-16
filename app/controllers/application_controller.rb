class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    return session[:user] || Guest.new
  end
  helper_method :current_user

  def set_current_user current_user
    session[:user] = current_user
  end
  helper_method :set_current_user
end
