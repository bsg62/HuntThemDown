require 'resolv'
require 'memoizable'

class ApplicationController < ActionController::Base
  include Memoizable

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Return user id
  #
  # @return [String]
  #
  # @api private
  #
  def user_id
    session[:user_id]
  end

  # Test if a user id is present
  #
  # @return [true]
  #   user id is present
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  #
  def user_id?
    !!user_id
  end

  # Return user
  #
  # @return [User]
  #
  # @api private
  #
  def user
    User.find_by(id: user_id)
  end
  memoize :user
  helper_method :user

  # Test if a user is present
  #
  # @return [true]
  #   user is present
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  #
  def user_exists?
    !!user
  end

  # Test if a user is logged in
  #
  # @return [true]
  #   user is loggend in
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  #
  def user_logged_in?
    user_id? && user_exists?
  end
  helper_method :user_logged_in?

  # Redirect logged out users to login form
  #
  # @api private
  #
  def authorize!
    redirect_to('/login', noctice: "Please log in!") unless user_logged_in?
  end

end
