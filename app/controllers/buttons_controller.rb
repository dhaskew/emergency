class ButtonsController < ApplicationController

  def index
    @buttons = current_user.apikeys.first.buttons
    respond_to do |format|
      format.html
      format.json
    end
  end

end

