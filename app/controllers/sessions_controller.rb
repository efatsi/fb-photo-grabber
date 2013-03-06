class SessionsController < ApplicationController

  def create
    user = User.from_access_token(request.env['omniauth.auth'].credentials.token)
    session[:user_id] = user.id

    redirect_to user_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
