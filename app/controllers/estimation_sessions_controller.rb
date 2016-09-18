class EstimationSessionsController < ApplicationController

	def single_person_estimation
		estimation_session = EstimationSession.find(params[:id])
		owner = estimation_session.Project.User
		params.each do |key, value|
			if key != :id
				estimation = owner.partial_estimations.create(estimation: value)
				estimation.story = Story.find(key)
				estimation_session.calculate_estimation(key)
			end	
		@estimated_stories = estimation_session.stories.to_json

		# TODO define view for rendering
		render ''
		end	
	end	

	def index
       render 'home/estimationPage'
    end
    def sidebar
       render 'home/sidebar'
    end
    def sidebarRight
       render 'home/sidebarRight'
    end
end
