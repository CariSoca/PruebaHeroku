class EstimationSession < ApplicationRecord
  has_one :proyect
  has_many :stories
end
