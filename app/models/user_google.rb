class UserGoogle < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |userGoogle|
      userGoogle.provider = auth.provider
      userGoogle.uid = auth.uid
      userGoogle.name = auth.info.name
      userGoogle.oauth_token = auth.credentials.token
      userGoogle.oauth_expires_at = Time.at(auth.credentials.expires_at)
      userGoogle.save!
    end
  end
end