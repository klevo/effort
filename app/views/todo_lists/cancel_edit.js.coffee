$todoList = $ '#<%= dom_id @todo_list %>'
$todoList.find('header').replaceWith '<%= j render(@todo_list) %>'
