class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to log_in_url, :notice => "Signed Up! You can now login"
    else
      render "new"
    end
  end
end
