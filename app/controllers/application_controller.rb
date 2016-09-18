class ApplicationController < ActionController::Base

 
  helper_method :current_user

  def current_user
    @current_user ||= UserGoogle.find(session[:userGoogle_id]) if session[:userGoogle_id]
  end
end
