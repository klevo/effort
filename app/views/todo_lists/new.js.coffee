$container = $b 'todo_list_form_container'
$container.html('<%= j render('form') %>').find('#todo_list_name').focus()
