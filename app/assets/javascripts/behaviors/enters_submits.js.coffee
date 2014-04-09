$(document).on 'keypress', behavior_selector('enter_submits'), (event) ->
  if event.which == 13
    event.preventDefault()
    $parent_form = $(this).closest 'form'
    $parent_form.submit()
