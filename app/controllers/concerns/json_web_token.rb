require 'jwt'
module JsonWebToken
	extend ActiveSupport::Concern
	ACCESS_TOKEN_KEY = Rails.application.credentials.jwt_tokens[:access_tokens_secret]
	REFRESH_TOKEN_KEY = Rails.application.credentials.jwt_tokens[:refresh_tokens_secret]
	ACCESS_TOKEN_EXPIRATION = 1.hour
	REFRESH_TOKEN_EXPIRATION = 1.day

	def access_token_encode(user, exp = ACCESS_TOKEN_EXPIRATION.from_now)
		payload = {
			exp: exp.to_i,
			user: user.attributes,
		}
		JWT.encode(payload, key=ACCESS_TOKEN_KEY)
	end

	def access_token_decode(token)
		decoded = JWT.decode(token, key=ACCESS_TOKEN_KEY).first
		HashWithIndifferentAccess.new(decoded)
	end

	def refresh_token_encode(user, exp = REFRESH_TOKEN_EXPIRATION.from_now)
		payload = {
			exp: exp.to_i,
			user: user.attributes,
		}
		JWT.encode(payload, key=REFRESH_TOKEN_KEY)
	end

	def refresh_token_decode(token)
		decoded = JWT.decode(token, key=REFRESH_TOKEN_KEY).first
		HashWithIndifferentAccess.new(decoded)
	end
end