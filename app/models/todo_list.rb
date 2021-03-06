class TodoList < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }
  scope :positioned,   -> { order position: :asc }
  scope :pending,      -> { where completed: false }
  scope :completed,    -> { where completed: true }

  belongs_to :project, touch: true
  has_many :todo_items, dependent: :destroy

  before_create :set_position_to_first

  def position_todo_items_according_to sorted_todo_item_ids
    if sorted_todo_item_ids.is_a?(Array)
      sorted_todo_item_ids.each_with_index do |todo_item_id, position|
        TodoItem.where(id: todo_item_id.to_i).first.update position: position, todo_list_id: id
      end
    else
      touch
    end
  end

  def set_position_to_first
    if self.position.nil?
      first_list = self.class.where(project_id: project_id).order(position: :asc).first
      self.position = (first_list.try(:position) || 1) - 1
    end

    true
  end
  
  def complete?
    completed?
  end
  
  def reassess_completion
    items_count = todo_items.count
    completed_items_count = todo_items.completed.count
    if completed_items_count > 0 && completed_items_count == items_count
      update completed: true
    elsif completed_items_count != items_count
      update completed: false
    end
  end
  
  def drop_item(todo_item, after:)
    todo_item.todo_list.touch unless todo_item.todo_list == self
    
    drop_to_position = nil
    
    if after.nil?
      lowest_positioned_item_in_this_list = todo_items.positioned.first
      drop_to_position = (lowest_positioned_item_in_this_list.position || 0) - 1
    else
      drop_to_position = after.position + 1
      # First update all following items
      todo_items.where('position >= ?', drop_to_position).update_all 'position = position + 1'
    end
    
    todo_item.update position: drop_to_position, todo_list: self
  end
  
  def how_many_more_completed_todo_items_than(num)
    todo_items.completed.count - num
  end
end
