class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
private
  def current_user
    if cookies[:auth_token]
      @current_user = User.find(params[:auth_token])
    end
  end
end
