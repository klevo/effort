$(document).on 'keydown', behaviorSelector('escape_cancels'), (event) ->
  # Escape
  if event.keyCode == 27
    event.preventDefault()
    $todoList = $(this).parents '.todo_list'
    $todoList.trigger 'cancel_todo_item_form'
  
  true
