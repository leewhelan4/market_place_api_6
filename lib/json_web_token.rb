class JsonWebToken

  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # encodes payload and adds expiration date, 24 hours by default.
  def self.encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # decodes token
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
