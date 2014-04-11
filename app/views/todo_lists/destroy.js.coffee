$todoList = $('#<%= dom_id @todo_list %>')
$todoList.hide 120, ->
  $todoList.remove()
