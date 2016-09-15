class ProjectsController < ApplicationController
  
  def index
           
    respond_to do |format|
      format.json { render json: Project.all }
      format.html
    end
  end	

  
end
