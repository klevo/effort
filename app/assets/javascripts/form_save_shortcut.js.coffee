$ ->
  Mousetrap.bind 'command+s', (e) ->
    e.preventDefault()
    $b('submit_on_shortcut').submit()