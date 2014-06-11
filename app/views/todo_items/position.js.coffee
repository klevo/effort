todoListSelector = "#<%= dom_id @todo_list %>"
$todoList = $ todoListSelector
$todoList.replaceWith '<%= j render(@todo_list) %>'

# DOM has changed, sortables need to be reinitialized
SortableList.initializeAll()