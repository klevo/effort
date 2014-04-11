$(document).on 'click', behavior_selector('cancel_add_todo_item_form'), (event) ->
  event.preventDefault()
  $parentForm = $(this).closest 'form'
  $parentForm.hide 66, ->
    $parentForm.remove()

  $todoList = $(this).closest '.todo_list'
  $todoList.trigger 'cancel_todo_item_form'
