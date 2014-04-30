require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  test "toggle - one pending item in a list with other completed, completes the list; touches project" do
    item = todo_items :vocab_database_three
    todo_list = todo_lists :vocab_database
    refute todo_list.complete?
    refute item.complete?
    
    now = Time.zone.local(2014, 4, 30)
    Timecop.travel now do
      item.toggle
    end
    
    item.reload
    assert item.complete?
    
    todo_list.reload
    assert todo_list.complete?
    
    project = projects :vocab
    assert_equal now, project.updated_at
  end
  
  test "toggle - one of all completed items, makes the list pending the list; touches project" do
    item = todo_items :vocab_flasher_one
    todo_list = todo_lists :vocab_flasher
    assert todo_list.complete?
    assert item.complete?
    
    now = Time.zone.local(2014, 4, 30)
    Timecop.travel now do
      item.toggle
    end
    
    item.reload
    refute item.complete?
    
    todo_list.reload
    refute todo_list.complete?
    
    project = projects :vocab
    assert_equal now, project.updated_at
  end
  
  test "adding new item to a completed list makes it incomplete" do
    todo_list = todo_lists :vocab_flasher
    assert todo_list.complete?
    
    now = Time.zone.local(2014, 4, 30)
    Timecop.travel now do
      todo_list.todo_items.create content: 'Do something'
    end
    
    todo_list.reload
    refute todo_list.complete?
    
    project = projects :vocab
    assert_equal now, project.updated_at
  end
  
  test "deleting incomplete item from otherwise completed list makes the list complete" do
    skip 'todo'
  end
end
