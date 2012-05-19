class UsersController < ApplicationController
  # rails g controller users new
  force_ssl

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies.permanent[:auth_token] = @user.auth_token
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
