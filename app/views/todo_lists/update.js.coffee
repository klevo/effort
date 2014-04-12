$todoList = $ '#<%= dom_id @todo_list %>'
$todoList.replaceWith '<%= j render(@todo_list) %>'

$todoList = $ '#<%= dom_id @todo_list %>'
$todoList.find('header').effect 'highlight', 800
