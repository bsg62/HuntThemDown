class SessionController < ApplicationController
  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to('/', notice: 'Logged in!')
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
