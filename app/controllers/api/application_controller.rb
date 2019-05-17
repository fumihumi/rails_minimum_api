# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    before_action :authorize

    # FIXME: render objects pattern
    def render_success(message = 'success')
      render json: { result: message }
    end

    def render_auth_error(message = 'unauthorized')
      render json: { result: message }, status: 401
    end

    def render_forbidden(message = 'forbidden')
      render json: { result: message }, status: 403
    end

    def render_conflict(message = 'conflict')
      render json: { result: message }, status: 409
    end

    attr_reader :current_user

    private

    def authorize
      unless request.authorization&.match(/\ABearer (.*)\z/)
        render_auth_error
        return
      end

      begin
        @current_user = JsonWebToken.to_user(Regexp.last_match(1))
        return render_auth_error unless @current_user
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  end
end
