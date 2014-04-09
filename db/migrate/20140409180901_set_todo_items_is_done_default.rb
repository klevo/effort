class SetTodoItemsIsDoneDefault < ActiveRecord::Migration
  def change
    change_column :todo_items, :is_done, :boolean, default: 0
  end
end
