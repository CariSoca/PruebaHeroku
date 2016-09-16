class HomeController < ApplicationController
  def index
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {name: "New Project"} }
    end
  end
end