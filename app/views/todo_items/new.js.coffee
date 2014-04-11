$todoList = $('#<%= dom_id @todo_list %>')
$todoList.trigger 'add_todo_item_form:before'

$formContainer = $todoList.find behavior_selector('add_todo_item_form_container')
$formContainer.append('<%= j render('form') %>')
$formContainer.find('#todo_item_content').focus()
