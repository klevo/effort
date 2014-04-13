$todoList = $ '#<%= dom_id @todo_list %>'
$todoList.find('header').replaceWith('<%= j render('todo_lists/header', todo_list: @todo_list) %>')
$todoList.find('header').effect 'highlight', 800
