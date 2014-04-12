$todoItem = $ '#<%= dom_id @todo_item %>'
$todoItem.replaceWith '<%= j render(@todo_item) %>'
