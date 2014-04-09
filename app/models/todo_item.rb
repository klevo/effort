class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, touch: true

  scope :positioned, -> { order position: :asc }
  scope :pending, -> { where is_done: false }
  scope :completed, -> { where is_done: true }

  def complete?
    is_done?
  end

  def toggle
    update is_done: !is_done
  end
end
