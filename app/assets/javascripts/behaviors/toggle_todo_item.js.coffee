$(document).on 'click', behavior_selector('toggle_todo_item'), (event) ->
  $toggle = $(this)
  $.post $toggle.data('toggle-url')
