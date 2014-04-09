window.makeTodoListSortable = ($list) ->
  $list.sortable(
    connectWith: behavior_selector('sortable')
  )


$ ->
  $b('sortable').each ->
    makeTodoListSortable $(this)
