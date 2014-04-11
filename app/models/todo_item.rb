class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, touch: true

  scope :positioned, -> { order position: :asc }
  scope :pending, -> { where is_done: false }
  scope :completed, -> { where is_done: true }
  scope :last_updated, -> { order updated_at: :desc }

  validates_presence_of :content

  def complete?
    is_done?
  end

  def toggle
    update is_done: !is_done
  end
end
