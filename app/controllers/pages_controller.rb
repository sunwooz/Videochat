class PagesController < ApplicationController
  def index
  end
  
  def room
    @api_key = '14991521'
    @api_secret = 'df63492d334eaef0eccea97185f5ce688860f1b3'
    @opentok = OpenTok::OpenTokSDK.new @api_key, @api_secret, @api_url => 'https://api.opentok.com/h1'
    
    session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled"}    # or disabled
    @session_id = @opentok.create_session( @location, session_properties )
    
    @token = @opentok.generate_token :session_id => session,
      :role => OpenTok::RoleConstants::PUBLISHER, 
      :connection_data => "username=Bob,level=4"
  end
  
  def contact
  end
  
  def about
  end
  
end
