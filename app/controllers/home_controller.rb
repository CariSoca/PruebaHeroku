class HomeController < ApplicationController
  
  def index
    
    a = "OTRA"
    
    render :json => {defecto: [consensus: "Average",strategy: "Fibonacci",cant: 7],
                      restoconsensus: [a],
                      restostrategys:  []
                      }
    
  end
  
  
end