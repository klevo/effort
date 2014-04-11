# To-do item form events

$(document).on 'cancel_todo_item_form', '.todo_list', (event) ->
  $addTodoItemFromContainer = $(event.target).closest('.todo_list').find behavior_selector('add_item_trigger_container')
  $addTodoItemFromContainer.show()

$(document).on 'add_todo_item_form:before', '.todo_list', (event) ->
  $addTodoItemFromContainer = $(event.target).find behavior_selector('add_item_trigger_container')
  console.debug $addTodoItemFromContainer.size()
  $addTodoItemFromContainer.hide()
