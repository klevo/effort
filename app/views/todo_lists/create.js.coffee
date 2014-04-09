$todoLists = $('section.todo_lists')

# There should be empty messsage if new todolist was added
$todoLists.find('.empty').remove()

$todoLists.prepend('<%= j render(@todo_list)  %>')
