class ConsensusStrategy
  # Receives a hash with participants and their estimations.
  # Returns a positive number when consensus is achieved,
  # 	else returns a negative number.
  # Must think some sort of code system
  #   to identify for each possible conflict, 
  #   the appropriate resolution strategy
  def apply_consensus (estimations)
  end	

  private  	
    def parameter_control (param)
  	  param.is_a?(Hash) && !param.empty?
    end	
    
end