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
  helper_method :user_exists?

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
    user_id? && user_exists? && user_totp?
  end
  helper_method :user_logged_in?

  def user_totp?
    if user.use_otp?
      !!session[:totp_auth]
    else
      true
    end
  end

  # Redirect logged out users to login form
  #
  # @api private
  #
  def authorize!
    session[:return_to] = request.fullpath
    redirect_to('/login', noctice: "Please log in!") unless user_logged_in?
  end

end
