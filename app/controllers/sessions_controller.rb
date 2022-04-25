class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:google_auth]

  def google_auth
    user = User.from_omniauth(auth)
    render(json: user, status: 401) if user.nil?
    user.save!
    log_in(user)
    render(json: user, status: 200)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
