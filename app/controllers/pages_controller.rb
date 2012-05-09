class PagesController < ApplicationController
  def index
  end
  
  def room
    @api_key = "15025822"        # Replace with your OpenTok API key.
    @api_secret = "ffe2c7919d9364e7f8f9154eaa5f33639bcbcee6"  # Replace with your OpenTok API secret.

    @opentok = OpenTok::OpenTokSDK.new @api_key, @api_secret
    @session = @opentok.create_session request.remote_addr

    @token = @opentok.generate_token :session_id => @session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => "username=Bob,level=4"
  end
  
  def contact
  end
  
  def about
  end
  
end
