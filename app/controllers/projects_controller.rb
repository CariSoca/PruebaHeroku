require 'json'
class ProjectsController < ApplicationController

	def create		
		@resp = params
		puts "balbalblabsdfsdfsdfsdfsdfsfd"
		puts @resp[:name]
		render json: @resp		
	end	  

end
