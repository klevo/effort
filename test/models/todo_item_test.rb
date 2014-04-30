require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  test "toggle - one pending item in a list with other completed, completes the list; touches project" do
    item = todo_items :vocab_database_three
    todo_list = todo_lists :vocab_database
    refute todo_list.completed?
    
    now = Time.zone.local(2014, 4, 30)
    Timecop.travel now do
      item.toggle
    end
    
    item.reload
    assert item.complete?
    
    todo_list.reload
    assert todo_list.completed?
    
    project = projects :vocab
    assert_equal now, project.updated_at
  end
  
  test "toggle - one of all completed items, makes the list pending the list; touches project" do
    
  end
end
