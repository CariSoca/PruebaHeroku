class ConsensusStrategyAverage < ConsensusStrategy

  def apply_consensus (estimations) 
  	return -1 if !parameter_control(estimations)
  	sum = 0
    estimations.each do |key, value|
      sum += value	
    end	
    sum.to_f / estimations.length.to_f
  end
  	
end	