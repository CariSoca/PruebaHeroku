require 'yaml'

class EstimationSession < ApplicationRecord
  belongs_to :project, :dependent => :destroy
  has_many :stories
  has_many :users, through: :session_memberships

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
  		@consensus_strategy = Object::const_get(strategies_ids[ self[:strategyId] ]).new
  	end	
  	
end
