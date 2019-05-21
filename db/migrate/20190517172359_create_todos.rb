class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :content
      t.integer :status, default: 0, null: false, limit: 1
      t.datetime :done_at
      t.references :user, null: false, index: true

      t.timestamps
    end
  end
end
