module Api
  class UsersController < Api::ApplicationController
    def me
      render json: UserSerializer.call(current_user), status: :ok
    end

    def show
      user = User.find(params[:id])
      render json: UserSerializer.call(user), status: :ok
    end

    def index
      users = User.all
      render json: UserSerializer.call(users), status: :ok
    end
  end
end
