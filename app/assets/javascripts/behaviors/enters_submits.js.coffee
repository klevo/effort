$(document).on 'keypress', behaviorSelector('enter_submits'), (event) ->
  # Enter
  if event.which == 13
    event.preventDefault()
    $parentForm = $(this).closest 'form'
    $parentForm.submit()

  # Escape
  # else if event.which == 27
  #   event.preventDefault()
  #   $todoList = $(this).closest '.todo_list'
  #
  #   $(document).trigger 'cancel_add_todo_list_form'
  #   $todoList.trigger('cancel_add_todo_list_form')
