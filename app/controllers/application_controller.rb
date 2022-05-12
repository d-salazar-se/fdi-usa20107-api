class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header.present?
      begin
        @decoded = access_token_decode(header)
        @current_user = User.find(@decoded[:user][:id])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound => e
        return render(json: { errors: e.message }, status: :unauthorized)
      rescue StandardError => e
        return render(json: { errors: e.message }, status: :internal_server_error)
      end
    end
end
