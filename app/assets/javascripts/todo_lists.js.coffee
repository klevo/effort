$(document).on 'click', behavior_selector('show_add_todo_list_form'), (event) ->
  $toggle = $(this)
  $.post $toggle.data('toggle-url')
