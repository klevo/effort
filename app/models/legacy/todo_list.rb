class Legacy::TodoList < ActiveRecord::Base
  establish_connection :legacy
end
