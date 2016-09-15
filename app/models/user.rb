class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_one :partial_estimation
end
