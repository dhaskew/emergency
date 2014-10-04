class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  alias_method :devise_current_user, :current_user
  before_action :auth_needed?#:authenticate_user!

  private

  def current_user
    return devise_current_user if request.format != :json
    return @_current_user if @_current_user
    token = request.headers["HTTP_AUTH_TOKEN"]
    key = Apikey.where(token: token).first!
    @_current_user = key.user
  end

  def auth_needed?
    authenticate_user! if request.format != :json
  end

end
