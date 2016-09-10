class EstimationSession < ApplicationRecord
  has_one :project
  has_many :stories
end
