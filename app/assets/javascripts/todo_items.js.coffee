# To-do item form events

$(document).on 'cancel_todo_item_form', '.todo_list', (event) ->
  $todoList = $(event.target)
  
  $todoListForm = $todoList.find 'form.new_todo_item'
  $todoListForm.hide 66, ->
    $todoListForm.remove()

  $addTodoItemFromContainer = $todoList.find behavior_selector('add_item_trigger_container')
  $addTodoItemFromContainer.show()

$(document).on 'click', behavior_selector('cancel_add_todo_item_form'), (event) ->
  event.preventDefault()
  $todoList = $(this).closest '.todo_list'
  $todoList.trigger 'cancel_todo_item_form'

$(document).on 'add_todo_item_form:before', '.todo_list', (event) ->
  $addTodoItemFromContainer = $(event.target).find behavior_selector('add_item_trigger_container')
  $addTodoItemFromContainer.hide()
