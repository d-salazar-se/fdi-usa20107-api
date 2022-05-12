require 'googleauth'

class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :refresh]

  def login
    render(json: generate_login_credentials, status: :ok) if valid_google_login
  end

  def refresh
    render(json: refresh_user_credentials, status: :ok)
  end

  private
    def login_params
      params.require(:auth).permit(:idToken)
    end

    def refresh_token_params
      params.require(:auth).permit(:refresh_token)
    end

    def valid_google_login
      @payload = Google::Auth::IDTokens.verify_oidc(login_params[:idToken], aud: Rails.application.credentials.google[:client_id])
      @user = User.for_login_authentication(@payload)
      true
    rescue Google::Auth::IDTokens::AudienceMismatchError, ActiveRecord::RecordNotFound => e
      return render(json: { errors: e.message }, status: :unauthorized)
    rescue 
      return render(json: { errors: e.message }, status: :internal_server_error)
    end

    def generate_login_credentials
      access_token = access_token_encode(@user)
      refresh_token = refresh_token_encode(@user)
      build_credentials(access_token, refresh_token, @user)
    end

    def refresh_user_credentials
      refresh_credentials(refresh_token_params[:refresh_token])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound => e
      return render(json: { errors: e.message }, status: :unauthorized)
    rescue StandardError => e
      return render(json: { errors: e.message }, status: :internal_server_error)
    end
end
