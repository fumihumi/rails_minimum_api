module Api
  class TodosController < Api::ApplicationController
    before_action :set_todo, only: %i[show]

    def index
      todos = Todo.all

      render json: TodoSerializer.new(todos).serializable_hash, status: :ok
    end

    def show
      options = { include: [:user] }

      render json: TodoSerializer.call(@todo, options), status: :ok
    end

    def create
      todo = current_user.todos.new(todo_params)

      if todo.save
        render json: TodoSerializer.call(todo), status: :ok
      else
        render json: { error: todo.errors.full_messages }, status: 400
      end
    end

    def update
      todo = current_user.todos.where(id: params[:id])
      if todo.update(todo_params)
        render json: TodoSerializer.call(todo), status: :ok
      else
        render json: { error: todo.errors.full_messages }, status: 400
      end
    end

    private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.permit(
        :title,
        :content,
        :status,
        :done_at
      )
    end
  end
end
