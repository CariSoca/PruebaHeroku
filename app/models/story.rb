class Story < ApplicationRecord
  belongs_to :estimation_session, dependant: :destroy
  has_many :partial_estimations
end
