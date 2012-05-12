class SessionsController < ApplicationController
  # rails g controller sessions new
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid login."
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to :root, :notice => "Logged out."
  end
end
