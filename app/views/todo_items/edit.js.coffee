$todoItem = $ '#<%= dom_id @todo_item %>'
$todoItem.html '<%= j render('form') %>'
$todoItem.find('#todo_item_content').focus().select()
