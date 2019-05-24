require 'rails_helper'

RSpec.describe 'TodoController' do
  let!(:user) { create(:user) }

  describe 'index' do

    before do
      3.times { create(:todo) }
    end
    it 'Todoの一覧を取得する', autodoc: true do
      get api_todos_path, headers: { 'Authorization' => "Bearer #{JsonWebToken.from_user(user)}" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'show' do
    let!(:todo) { create(:todo) }

    it 'Todoの詳細をみる', autodoc: true do
      get api_todo_path(todo), headers: {
        'Authorization' => "Bearer #{JsonWebToken.from_user(user)}"
      }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    let!(:todo) { build(:todo) }

    let!(:describe) do
      <<~MSG
        [要ログイン]
        ##Paramater
        title: string
        content?: string
        status: string
        done_at?: DateTime (if (status == checked) required!)
      MSG
    end
    it '新しいTodoをつくる', autodoc: true do
      post api_todos_path,
           params: {
             title: 'test_title',
             content: 'test_content',
             status: 'unchecked'
           },
           headers: { 'Authorization' => "Bearer #{JsonWebToken.from_user user}" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    let(:unchecked_todo){ create(:todo, user: user, status: :unchecked) }
    let(:doing_todo) {create(:todo, user: user, status: :doing)}
    let(:checked_todo){ create(:todo, user: user, status: :checked)}
    let(:archived_todo) { create(:todo, user: user, status: :archived) }
    let!(:params) {
      { title: Faker::Book.title }
    }

    it 'unchecked -> doingになること', autodoc: true do
      params[:status] = 'doing'
      patch api_todo_path(unchecked_todo),
            params: params,
            headers: {
              'Authorization' => "Bearer #{JsonWebToken.from_user user}"
            }

      expect(response).to have_http_status(:ok)
    end

    it 'doing -> checkedになること', autodoc: true do
      params[:status] = 'checked'
      params[:done_at] = Time.current

      patch api_todo_path(doing_todo),
            params: params,
            headers: {
              'Authorization' => "Bearer #{JsonWebToken.from_user user}"
            }

      expect(response).to have_http_status(:ok)
    end

    it 'checked -> archivedになること', autodoc: true do
      params[:status] = 'archived'
      patch api_todo_path(checked_todo),
            params: params,
            headers: {
              'Authorization' => "Bearer #{JsonWebToken.from_user user}"
            }

      expect(response).to have_http_status(:ok)
    end

    it 'checked -> uncheckedにもどせること', autodoc: true do
      params[:status] = 'unchecked'
      patch api_todo_path(checked_todo),
            params: params,
            headers: {
              'Authorization' => "Bearer #{JsonWebToken.from_user user}"
            }

      expect(response).to have_http_status(:ok)
    end
  end
end
