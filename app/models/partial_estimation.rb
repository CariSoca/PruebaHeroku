class PartialEstimation < ApplicationRecord
  belongs_to :user, dependant: :destroy
  has_one :story
end
