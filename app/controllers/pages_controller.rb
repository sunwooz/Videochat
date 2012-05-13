class PagesController < ApplicationController
  before_filter :logged_in?, :only => [ :room, :newsession ]

  def logged_in?
    if session[:user] = current_user
      current_user
    else
      redirect_to log_in_path, :notice => "You do not have access to this page. Please Signup or Login!"
    end
  end
  
  def newsession
    @api_key = "15025822"        # Replace with your OpenTok API key.
    @api_secret = "ffe2c7919d9364e7f8f9154eaa5f33639bcbcee6"  # Replace with your OpenTok API secret.

    @opentok = OpenTok::OpenTokSDK.new @api_key, @api_secret
    @session = @opentok.create_session request.remote_addr

    @token = @opentok.generate_token :session_id => @session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => "username=Bob,level=4"
  end
  
  def room
    @api_key = "15025822"        # Replace with your OpenTok API key.
    @api_secret = "ffe2c7919d9364e7f8f9154eaa5f33639bcbcee6"  # Replace with your OpenTok API secret.

    @opentok = OpenTok::OpenTokSDK.new @api_key, @api_secret
    @session = '1_MX4xNTAyNTgyMn4xMC4xMDQuMTE1LjIwMH4yMDEyLTA1LTEwIDE2OjM4OjA4LjgxNjA3NCswMDowMH4wLjQ5MzA1ODMxMzI4NH4'

    @token = @opentok.generate_token :session_id => @session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => "username=Bob,level=4"
  end
  
  def contact
  end
  
  def about
  end

end
