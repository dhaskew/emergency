class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def current_user
    return @_current_user if @_current_user
    token = request.headers["HTTP_AUTH_TOKEN"]
    key = Apikey.where(token: token).first!
    @_current_user = key.user
  end

end
