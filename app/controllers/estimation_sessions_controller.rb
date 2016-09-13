class EstimationSessionsController < ApplicationController

	def single_person_estimation
		estimation_session = EstimationSession.find(params[:id_session])
		owner = estimation_session.Project.User
		params.each do |key, value|
			if key != :id_session
				estimation = owner.partial_estimations.create(estimation: value)
				estimation.story = Story.find(key)
				estimation_session.calculate_estimation(key)
			end	
		@estimated_stories = estimation_session.stories

		# TODO define view for rendering
		render ''
		end	
	end	
end
