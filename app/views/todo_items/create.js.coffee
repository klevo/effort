$todo_list = $('#<%= dom_id @todo_item.todo_list %>')
$items_container = $todo_list.find('.items')
$items_container.append('<%= j render(@todo_item) %>')

$add_new_item_content = $todo_list.find('#todo_item_content')
$add_new_item_content.val('').focus()
