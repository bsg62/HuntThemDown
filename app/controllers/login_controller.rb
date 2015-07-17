class LoginController < ApplicationController
  layout 'login'

  def index
  end

  def otp
    redirect_to('/login') unless user_exists?
  end
end
