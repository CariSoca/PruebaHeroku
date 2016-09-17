class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= UserGoogle.find(session[:userGoogle_id]) if session[:userGoogle_id]
  end
end