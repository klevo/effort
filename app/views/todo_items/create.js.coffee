$todo_list = $('#<%= dom_id @todo_item.todo_list %>')
$items_container = $todo_list.find('.items')
$items_container.append('<%= j render(@todo_item) %>')
