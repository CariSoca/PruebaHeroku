class Proyect < ApplicationRecord
  has_many :estimation_sessions
  has_and_belongs_to_many :users
  has_one :user
end
