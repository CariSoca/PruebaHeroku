class ConsensusStrategyAverage < ConsensusStrategy
	# must control that estimations is a hash
  def applyConsensus (estimations) 
  	return 0 if !parameterControl(estimations) # 'estimations' is not a hash
  	sum = 0
    estimations.each do |key, value|
      sum += value	
    end	
    return sum / estimations.lenght # returns average
  end	
end	