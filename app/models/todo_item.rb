class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, touch: true

  scope :positioned,   -> { order position: :asc }
  scope :pending,      -> { where is_done: false }
  scope :completed,    -> { where is_done: true }

  validates_presence_of :content
  before_create :set_position
  after_create :reasses_todo_list_completion
  after_destroy :reasses_todo_list_completion
  
  def self.last_updated(limit = nil)
    order(updated_at: :desc).limit(limit)
  end

  def complete?
    is_done?
  end

  def toggle
    update is_done: !is_done
    reasses_todo_list_completion
  end
  
  def reasses_todo_list_completion
    todo_list.reassess_completion
    true
  end
  
  def set_position
    self.position = (todo_list.todo_items.positioned.last.try(:position) || 0) + 1
    true
  end
end
