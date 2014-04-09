class AddPositionToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :position, :integer
    add_index :todo_items, :position

    TodoItem.reset_column_information
    TodoList.find_each do |todo_list|
      position = 1
      todo_list.todo_items.order(updated_at: :desc).each do |todo_item|
        todo_item.update_columns position: position
        position += 1
      end
    end
  end
end
