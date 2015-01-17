require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  test "drop_item" do
    skip 'TODO'
    todo_list.drop_item(itemA, after: item1)
  end
end
