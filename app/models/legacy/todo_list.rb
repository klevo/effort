class Legacy::TodoList < ActiveRecord::Base
  establish_connection :legacy

  belongs_to :project
  has_many :todo_items
end
