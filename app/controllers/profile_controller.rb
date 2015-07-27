class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :settings, :settings_common, :settings_password, :settings_two_factor, :save_password]
  before_filter :authorize!

  def show
  end

  def settings
  end

  def settings_common
  end

  def settings_password
  end

  def settings_two_factor
  end

  def save_password
    unless @user.authenticate(params[:current_password])
      flash.alert = 'Invalid current password!'
      return redirect_to :back
    end

    unless params[:new_password] == params[:confirm_new_password]
      flash.alert = 'Passwords don\'t match'
      return redirect_to :back
    end

    @user.update(password: params[:new_password])
    @user.save

    redirect_to profile_settings_path
  end

  private

  def set_user
    @user = User.find_by(id: user.id)
  end
end
