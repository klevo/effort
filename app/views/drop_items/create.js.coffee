todoItemSelector = "#<%= dom_id @todo_item %>"
$todoItem = $ todoItemSelector
$todoItem.html $('<%= j render(@todo_item) %>').html()