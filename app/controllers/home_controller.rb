class HomeController < ApplicationController
  
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {default:{consensus: "Average"
					   series:"Fibonacci",
					   number_of_vals: 7,
					   timebox: [1,0]},
				  consensus_list: ["Average"],
				  series_list:["Fibonacci","T-shirts","Powers of 2"] } }
   end

  end
  
  
end
