class PagesController < ApplicationController
  def index
  end
  
  def room
    @api_key = "14991521"        # Replace with your OpenTok API key.
    @api_secret = "df63492d334eaef0eccea97185f5ce688860f1b3"  # Replace with your OpenTok API secret.

    @opentok = OpenTok::OpenTokSDK.new @api_key, @api_secret
    @session = @opentok.create_session request.remote_addr

    @token = @opentok.generate_token :session_id => @session, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => "username=Bob,level=4"
  end
  
  def contact
  end
  
  def about
  end
  
end
