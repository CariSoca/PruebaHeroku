class PartialEstimation < ApplicationRecord
  belongs_to :user, dependent => :destroy
  has_one :story
end
