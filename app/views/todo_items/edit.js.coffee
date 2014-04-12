$todoItem = $ '#<%= dom_id @todo_item %>'
$content = $todoItem.find '.content'
$content.html '<%= j render('form') %>'
