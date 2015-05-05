itemsHtml = '<%=j render('todo_items/index') %>'
$('#<%= dom_id(@todo_list) %>_todo_items').html(itemsHtml)