class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :partial_estimations
end
	