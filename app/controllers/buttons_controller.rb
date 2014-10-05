class ButtonsController < ApplicationController

  def index
    @buttons = current_user.apikeys.first.buttons
    respond_to do |format|
      format.html
      format.json
    end
  end

  def alert
    
    account_sid = ENV["twillio_sid"]
    account_token = ENV["twillio_token"]
    
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, account_token

    # alternatively, you can preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = account_token
    end

    # and then you can create a new client without parameters
    @client = Twilio::REST::Client.new
    @client2 = Twilio::REST::Client.new    
    
    @client.messages.create(
      from: '+16784981022',
      to: '+14049989321',
      #to: ['+14044068958','+14049989321'],
      body: 'Hey there!'
    )
   
    @client2.messages.create(
      from: '+16784981022',
      to: '+14044068958',
      body: 'Hey there 2!'
    )

    AlertMailer.send_alert(1).deliver
  end

end

