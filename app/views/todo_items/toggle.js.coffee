$todoItem = $('#<%= dom_id @todo_item %>')
$todoItem.remove()

$todo_list = $('#<%= dom_id @todo_item.todo_list %>')

<% if @todo_item.complete? %>
$todo_list.find('.completed_items').prepend '<%= j render(@todo_item) %>'
<% else %>
$todo_list.find('.items').append '<%= j render(@todo_item) %>'
<% end %>
