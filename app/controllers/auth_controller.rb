require 'googleauth'

class AuthController < ApplicationController

  def login
    token = params[:idToken]

    payload = Google::Auth::IDTokens.verify_oidc(token, aud: ENV['GOOGLE_CLIENT_ID'])

    email = payload['email']

    user = User.find_by email: email, enabled: true

    if not user
      # throw Unauthorized error
      render json: user, status: 401
      return
    end

    user.name = payload['name']
    user.picture = payload['picture']

    user.save

    # generate token

    # add token to headers

    render json: user, status: 200
  end

  def refresh
  end

end
