class ButtonsController < ApplicationController

  def index
    @buttons = current_user.apikeys.first.buttons
    respond_to do |format|
      format.html
      format.json
    end
  end

  def alert
    AlertMailer.send_alert(1).deliver
  end

end

