class User < ApplicationRecord
  has_and_belongs_to_many :proyects
  has_one :partial_estimation
end
