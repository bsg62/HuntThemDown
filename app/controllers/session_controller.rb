class SessionController < ApplicationController
  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?('/logout')

      if user.use_otp
        return redirect_to('/login/otp')
      end

      logger.debug "URL to redirect to: #{url}"
      redirect_to(url)
    else
      flash.now.alert = 'Invalid login credentials!'
      redirect_to('users/new', notice: 'Logged in!')
    end
  end

  def otp_auth
    return redirect_to('/login') unless user_exists?

    if user.authenticate_otp(params[:otp])
      session[:totp_auth] = true

      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?('/logout')
      logger.debug "URL to redirect to: #{url}"
      redirect_to(url)
    else
      redirect_to('/login')
    end
  end

  def destroy
    session[:user_id] = nil
    session[:totp_auth] = false
    redirect_to('/', notice: 'Logged out!')
  end
end
