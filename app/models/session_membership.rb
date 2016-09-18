class SessionMembership < ApplicationRecord
 belongs_to :user, :dependent => :destroy
 belongs_to :estimation_session, :dependent => :destroy
end
