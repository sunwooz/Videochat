class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
        redirect_to root_url, :notice => "You have logged in"
      else
        cookies[:auth_token] = user.auth_token
        redirect_to root_url, :notice => "You have logged in"
      end
    else
      flash.now.alert = "Invalid Email or Password"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "logged out"
  end
end
