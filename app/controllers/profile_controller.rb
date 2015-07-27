class ProfileController < ApplicationController
  before_action :set_user
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

  def show_enable_two_factor
    if !@user.use_otp?
      @user.update_attribute(:otp_secret_key, ROTP::Base32.random_base32)
      @qr = RQRCode::QRCode.new(@user.provisioning_uri('HuntThemDown'), :level => :h)
    else
      redirect_to profile_settings_2fa_path
    end
  end

  def enable_two_factor
    if user.authenticate_otp(params[:confirmation_otp])
      @user.update_attribute(:use_otp, true)
      flash.notice = '2FA enabled successfully!'

      redirect_to profile_settings_2fa_path
    else
      redirect_to '/profile/settings/enable-2fa'
    end
  end

  def show_disable_two_factor

  end

  def disable_two_factor

  end

  private

  def set_user
    @user = User.find_by(id: user.id)
  end
end
