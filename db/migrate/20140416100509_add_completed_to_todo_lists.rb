class AddCompletedToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :completed, :boolean, default: 0

    TodoList.reset_column_information
    TodoList.includes(:todo_items).find_each do |list|
      completed = true

      list.todo_items.each do |item|
        completed = false unless item.complete?
      end

      if completed
        list.update_columns completed: completed
      end
    end
  end
end
