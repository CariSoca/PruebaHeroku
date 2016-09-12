require 'securerandom'

class EstimationSession < ApplicationRecord
  has_one :project
  has_many :stories
  before_create :generate_link

  
  private

    def generate_link
  	  self.sharedLink = loop do
  	    random_token = SecureRandom.hex(32)
  		break random_token unless EstimationSession.exists?(sharedLink: random_token)
  	  end
    end


end
