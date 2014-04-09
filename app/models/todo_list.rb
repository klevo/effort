class TodoList < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }

  belongs_to :project, touch: true
  has_many :todo_items

  def position_todo_items_according_to sorted_todo_item_ids
    sorted_todo_item_ids.each_with_index do |todo_item_id, position|
      todo_items.where(id: todo_item_id.to_i).update_all position: position
    end
  end
end
