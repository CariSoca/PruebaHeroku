require 'json'
class ProjectsController < ApplicationController

	def new		
		@resp = params[:name]
		render json: @resp		
	end	  

end
