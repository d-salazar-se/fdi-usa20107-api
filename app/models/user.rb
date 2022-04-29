class User < ApplicationRecord
  validates :email, email: { domain: 'usach.cl' }
  
  def update_from_login(payload)
    self.name = payload['name']
    self.picture = payload['image']
    save!
    true
  end
end
