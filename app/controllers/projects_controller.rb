class ProjectsController < ApplicationController

	
	def create
          userParams = {'email' => params[:email], 'nickname' => params[:nickname]}		
	  user = User.new(userParams)
	  user.save()

	  projectParams = {'name' => params[:name]}
	  project = Project.new(projectParams)
	  project.user = user
	  #project = user.create_project(projectParams) #ownership
	  project.save()	 

	  
	  estimation_session = project.estimation_sessions.create(id: 3, title: params[:name],synchronous: true, 					beginningTime: Time.now)
 
	  #user.estimation_sessions << estimation_session
	  session_membership = SessionMembership.new()
          session_membership.user = user
	  session_membership.estimation_session = estimation_session
          session_membership.save()	  

	  params[:stories].each do |story|
	 
	   estimation_session.stories.create(name: story)
	  end
	 		
	  
	  
	  	  

	end	  

end
