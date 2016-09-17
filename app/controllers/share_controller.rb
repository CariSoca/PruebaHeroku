class ShareController < ApplicationController
	def index
	respond_to do |format|
      format.html { render 'home/share'}
      format.json { render json: {link: "https://toggl.com/app/timer",
      							  contributors: ["Daniel Porzio", "Invitado", "Invitado", "Nicolás Urruty"]
								 }
				  }
    end
	end	
end
