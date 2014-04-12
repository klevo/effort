$todoList = $ '#<%= dom_id @todo_list %>'
$todoList.find('header').html '<%= j render('form') %>'
$todoList.find('#todo_list_name').focus().select()
