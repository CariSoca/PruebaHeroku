class Story < ApplicationRecord
  belongs_to :estimation_session
  has_many :partial_estimations
end
