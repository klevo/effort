class TodoList < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }

  belongs_to :project, touch: true
  has_many :todo_items
end
