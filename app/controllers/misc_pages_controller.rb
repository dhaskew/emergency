class MiscPagesController < ApplicationController
  def index
    if current_user.apikeys.first == nil
      render :newkey
    else
      @key = current_user.apikeys.first
      @buttons = @key.buttons
    end
  end

  def newkey
    @device = params["device"]
    @key = current_user.apikeys.new
    @key.name = @device
    @key.token = @device.gsub(/\s+/, "").reverse
    if @key.save!
      redirect_to :action => 'newdevice'      
      #redirect_to root_path 
    end
  end

  def newdevice
    @key = current_user.apikeys.first
  end
end
