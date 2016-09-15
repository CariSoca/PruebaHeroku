class Story < ApplicationRecord
  has_one :estimation_session
  has_many :partial_estimations
end
