class User < ApplicationRecord
  validates :email, email: { domain: 'usach.cl' }

  def self.for_login_authentication(payload)
    user = find_by!(email: payload['email'], enabled: true)
    user.update_from_login(payload)
    user
  end
  
  def update_from_login(payload)
    self.name = payload['name']
    self.picture = payload['picture']
    save!
  end
end
