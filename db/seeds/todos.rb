User.all.each do |user|
  3.times do |n|
    user.todos.unchecked.create(title: "#{n}個目の未完了タスク")
    user.todos.doing.create(title: "#{n}個目の着手中タスク")
    user.todos.checked.create(title: "#{n}個目の完了タスク", done_at: Date.current)
    user.todos.archived.create(title: "#{n}個目の廃棄タスク")
  end
end
