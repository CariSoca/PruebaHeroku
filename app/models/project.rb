class Project < ApplicationRecord
  has_many :estimation_sessions
  belongs_to :user #ownership  
end
