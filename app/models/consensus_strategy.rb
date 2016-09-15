class ConsensusStrategy
  # Receives a hash with participants and their estimations.
  # Returns a positive number when consensus is achieved,
  # 	else returns a negative number.
  # Must think some sort of code system
  #   to identify for each possible conflict, 
  #   the appropriate resolution strategy
  def applyConsensus (estimations)
  end	

  private
  	# controls the argument received is hash type
    def parameterControl (param)
  	  param.is_a?(Hash) ? return true : return false
    end	
end