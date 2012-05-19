class SessionsController < ApplicationController
  # rails g controller sessions new
  force_ssl

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid login."
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to :root, :notice => "Logged out."
  end
end
