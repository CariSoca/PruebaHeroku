class Project < ApplicationRecord
	has_many :estimation_sessions
  has_and_belongs_to_many :users
  has_one :user

  # link to current consensus strategy
  attr_accessor :consensusStrategy
  
end
