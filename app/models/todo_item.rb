class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, touch: true

  scope :pending, -> { where is_done: false }
  scope :completed, -> { where is_done: true }

  def completed?
    is_done?
  end
end
