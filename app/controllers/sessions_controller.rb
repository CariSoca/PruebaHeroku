class SessionsController < ApplicationController
  def create
    userGoogle = UserGoogle.from_omniauth(env["omniauth.auth"])
    session[:userGoogle_id] = userGoogle.id
    redirect_to root_path
  end

  def destroy
    session[:userGoogle_id] = nil
    redirect_to root_path
  end
end