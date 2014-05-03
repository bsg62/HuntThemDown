require 'memoizable'

class ApplicationController < ActionController::Base
  include Memoizable

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_id
    session[:user_id]
  end

  def user_id?
    !!user_id
  end

  def user
    User.find(user_id)
  end
  memoize :user

  def actor
    user
  end
  helper_method :actor

  def user_exists?
    !!user
  end

  def user_logged_in?
    user_id? && user_exists?
  end
  helper_method :user_logged_in?

  def authorize!
    redirect_to('/login', noctice: "Please log in!") unless user_logged_in?
  end

end
