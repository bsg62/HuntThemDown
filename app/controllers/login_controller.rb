class LoginController < ApplicationController
  layout 'login'

  def index
  end

  def two_factor
    redirect_to('/login') unless user_exists?
  end
end
