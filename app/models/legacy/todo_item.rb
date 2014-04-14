class Legacy::TodoItem < ActiveRecord::Base
  establish_connection :legacy

  belongs_to :todo_list
end
