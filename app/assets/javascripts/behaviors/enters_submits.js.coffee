$(document).on 'keypress', behaviorSelector('enter_submits'), (event) ->
  # Enter
  if event.which == 13
    event.preventDefault()
    $parentForm = $(this).closest 'form'
    $parentForm.submit()

