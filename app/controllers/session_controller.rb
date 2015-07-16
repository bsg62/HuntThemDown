class SessionController < ApplicationController
  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?('/logout')
      logger.debug "URL to redirect to: #{url}"
      redirect_to(url)
    else
      flash.now.alert = 'Invalid login credentials!'
      redirect_to('users/new', notice: 'Logged in!')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to('/', notice: 'Logged out!')
  end
end
