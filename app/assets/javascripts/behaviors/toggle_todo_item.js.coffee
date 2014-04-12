$(document).on 'click', behaviorSelector('toggle_todo_item'), (event) ->
  $toggle = $(this)
  $.post $toggle.data('toggle-url')
