require 'googleauth'

class AuthController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :refresh]

  def login
    render(json: generate_login_credentials, status: :ok) if validate_google_login
  end

  def refresh
    render(json: refresh_credentials, status: :ok)
  end

  def logout
    render(json: {}, status: :ok)
  end

  private
    def login_params
      params.require(:auth).permit(:idToken)
    end

    def refresh_token_params
      params.require(:auth).permit(:refresh_token)
    end

    def validate_google_login
      begin
        @payload = Google::Auth::IDTokens.verify_oidc(login_params[:idToken], aud: Rails.application.credentials.google[:client_id])
        @user = User.find_by(email: @payload['email'], enabled: true)
        @user.update_from_login(@payload)
      rescue Google::Auth::IDTokens::AudienceMismatchError => e
        return render(json: { errors: e.message }, status: :unauthorized)
      rescue StandardError => e
        return render(json: { errors: e.message }, status: :internal_server_error)
      end
    end

    def generate_login_credentials
      access_token = access_token_encode(@user)
      refresh_token = refresh_token_encode(@user)
      build_credentials(access_token, refresh_token)
    end

    def refresh_credentials
      begin
        refresh_token = refresh_token_params[:refresh_token]
        @decoded = refresh_token_decode(refresh_token)
        @user = User.find(@decoded[:user][:id])
        new_access_token = access_token_encode(@user)
        build_credentials(new_access_token, refresh_token)
      rescue JWT::DecodeError => e
        return render(json: { errors: e.message }, status: :unauthorized)
      rescue ActiveRecord::RecordNotFound => e
        return render(json: { errors: e.message }, status: :internal_server_error)
      end
    end

    def build_credentials(access_token, refresh_token)
      {
        access_token: access_token,
        token_type: "bearer",
        expires_in: ACCESS_TOKEN_EXPIRATION.to_i,
        refresh_token: refresh_token,
        user: @user.attributes,
      }
    end
end
