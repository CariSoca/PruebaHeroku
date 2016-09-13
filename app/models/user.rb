class User < ApplicationRecord
  has_many :projects
  has_many :partial_estimations
end
