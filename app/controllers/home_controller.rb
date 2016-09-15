class HomeController < ApplicationController
  def index
    
    render :json => { strategy: "Nombre Strategy" }
    
  end
end