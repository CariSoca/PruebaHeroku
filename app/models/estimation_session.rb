require 'securerandom'
require 'yaml'

class EstimationSession < ApplicationRecord
  has_one :project
  has_many :stories
  before_create :generate_link  

  attr_accessor :consensus_strategy 

  def calculate_estimation (story_id)
  	set_consensus_strategy

  	# Generate 'estimations' hash with participants estimations

  	story = self.stories.find(story_id)
  	partial_estimations = story.partial_estimations.all
  	estimations = {}
  	partial_estimations.each do |e|
  		key = e.user.nickname
  		estimations[:key] = e.estimation
  	end	

  	@consensus_strategy.apply_consensus(estimations)

  end	

  private
  	def set_consensus_strategy
  		strategies_ids = YAML.load_file("#{Rails.root.to_s}/config/custom/strategies_ids.yml")
  		@consensus_strategy = Object::const_get(strategies_ids[self.strategyId]).new
  	end	

  	def generate_link
  	  self.sharedLink = loop do
  	    random_token = SecureRandom.hex(32)
  		break random_token unless EstimationSession.exists?(sharedLink: random_token)
  	  end
    end	

end
