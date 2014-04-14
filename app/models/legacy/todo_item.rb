class Legacy::TodoItem < ActiveRecord::Base
  establish_connection :legacy
end
