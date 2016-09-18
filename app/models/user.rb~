class User < ApplicationRecord
  has_many :projects #ownership 
  has_many :partial_estimations 
  has_many :projects, through: :session_memberships
end
	
