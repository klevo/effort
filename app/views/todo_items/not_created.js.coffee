$todo_list = $('#<%= dom_id @todo_item.todo_list %>')
$addNewItemContent = $todo_list.find('.actions')
$addNewItemContent.effect('shake')
