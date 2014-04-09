class TodoList < ActiveRecord::Base
  belongs_to :project, touch: true
  has_many :todo_items
end
