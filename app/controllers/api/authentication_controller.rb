# frozen_string_literal: true

module Api
  class AuthenticationController < Api::ApplicationController
    before_action :authorize, except: :login

    def login
      user = User.find_by(email: login_params[:email])

      if user&.authenticate(login_params[:password])
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i

        render json: { token: token, expired_at: time.to_s }, status: :ok
      else
        render_auth_error
      end
    end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end
