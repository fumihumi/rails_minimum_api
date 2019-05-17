# frozen_string_literal: true

require 'jwt'

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  class << self
    def from_user(user)
      encode(id: user.id)
    end

    def to_user(token)
      id = decode(token)['user_id']
      User.find id
    end

    def encode(payload)
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
    end
  end

end
