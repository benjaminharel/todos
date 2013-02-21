class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :position, :default => 0
      t.string :title
      t.text :description
      t.date :due_date, :default => Date.today + 1.month
      t.boolean :checked, :default => false
      t.integer :todo_list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
