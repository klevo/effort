$todoList = $('#<%= dom_id @todo_list %>')
$todoList.trigger 'add_todo_item_form:before'

$formContainer = $todoList.find behaviorSelector('add_todo_item_form_container')
$formContainer.append('<%= j render('form') %>')
$formContainer.find('#todo_item_content').focus()

# Cancel other add todo item forms
$todoList.siblings().trigger 'cancel_todo_item_form'