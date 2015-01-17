require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  test "drop_item" do
    todo_list.drop_item(itemA, after: item1)
  end
end
