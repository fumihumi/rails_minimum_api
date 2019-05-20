require 'spec_helper'

RSpec.describe 'Todo', type: :model do
  let!(:todo) { create(:todo) }

  describe 'validations' do
    context 'invalid' do
      it 'todo have all property' do
        expect(todo.valid?).to be true
      end
    end

    context 'valid' do
      it 'title is nil' do
        todo.title = nil

        expect(todo.valid?).to be false
        expect(todo.errors.messages.length).to be 1
      end

      it 'status is nil' do
        todo.status = nil

        expect(todo.valid?).to be false
        expect(todo.errors.messages.length).to be 1
      end

      it "status isn't checked, when has done_at " do
        if todo.checked?
          expect(todo.done_at).not_to be nil
        else
          todo.done_at = Time.current
          expect(todo.valid?).to be true
        end
      end
    end
  end
end

