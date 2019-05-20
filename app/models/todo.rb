class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :status, presence: true
  validate :checked_state_has_to_done_at

  enum status: {
    unchecked: 0,
    doing: 10,
    checked: 20,
    archived: 50
  }

  private

  def checked_state_has_to_done_at
    return unless checked?

    errors.add('完了日時を入力してください') unless done_at
  end
end
