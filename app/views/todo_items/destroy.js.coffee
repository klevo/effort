$todoItem = $('#<%= dom_id @todo_item %>')
$todoItem.hide 120, ->
  $todoItem.remove()
