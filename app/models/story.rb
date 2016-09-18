class Story < ApplicationRecord
  belongs_to :estimation_session, :dependent => :destroy
  has_many :partial_estimations
end
