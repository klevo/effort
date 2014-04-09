class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.references :project, index: true
      t.string :name
      t.integer :position

      t.timestamps
    end
    add_index :todo_lists, :position
  end
end
