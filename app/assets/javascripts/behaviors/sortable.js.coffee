window.makeTodoListSortable = ($list) ->
  $list.sortable()


$ ->
  $b('sortable').each ->
    makeTodoListSortable $(this)
