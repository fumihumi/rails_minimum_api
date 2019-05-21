FactoryBot.define do
  factory :todo do
    user

    title { Faker::Book.title }
    status { Todo.statuses.keys.sample }
    done_at { Time.current if checked? }
  end
end
