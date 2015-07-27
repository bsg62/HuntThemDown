class ProfileController < ApplicationController
  before_action :set_user
  before_filter :authorize!

  def show
  end
  
  private

  def set_user
    @user = User.find_by(id: user.id)
  end
end
