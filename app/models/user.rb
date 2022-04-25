class User < ApplicationRecord
  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first
    return nil if user.nil?
    user.uid = auth.uid
    user.name = auth.info.name
    user.picture = auth.info.image
    user.google_token = auth.credentials.token
    user.google_refresh_token = auth.credentials.refresh_token if auth.credentials.refresh_token.present?
    user
  end
end
