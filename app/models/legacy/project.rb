class Legacy::Project < ActiveRecord::Base
  establish_connection :legacy

  has_many :todo_lists
  has_many :messages
end
