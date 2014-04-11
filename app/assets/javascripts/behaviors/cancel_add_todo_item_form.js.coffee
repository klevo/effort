$(document).on 'click', behavior_selector('cancel_add_todo_item_form'), (event) ->
  event.preventDefault()
  $parent_form = $(this).closest 'form'
  $parent_form.hide 66, ->
    $parent_form.remove()
