$(document).on 'click', behavior_selector('show_add_todo_list_form'), (event) ->
  event.preventDefault()

  $formContainer = $b('todo_list_form_container')
  $formContainer.show(60)

  $formContainer.find('#todo_list_name').focus()

$(document).on 'click', behavior_selector('cancel_add_todo_list_form'), (event) ->
  event.preventDefault()
  $(document).trigger 'cancel_add_todo_list_form'

$(document).on 'cancel_add_todo_list_form', ->
  $formContainer = $b('todo_list_form_container')
  $formContainer.hide(40)
