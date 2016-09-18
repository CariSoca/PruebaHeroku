class User < ApplicationRecord
  has_many :projects #ownership 
  has_many :partial_estimations 
  has_many :projects, through: :session_memberships


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider      
      user.uid = auth.uid
      user.nickname = auth.info.name
      user.email = auth.info.email
      #userGoogle.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
	
