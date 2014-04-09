previousPositionUpdateData = {}

# http://api.jqueryui.com/sortable/#event-change
updatePosition = (event, ui) ->
  $todoList = ui.item.closest '.todo_list'
  data = []
  $todoList.find('.todo_item').each ->
    id_attr = $(this).attr('id')
    id = _(id_attr.split('_')).last()
    data.push id

  url = $todoList.data('position-url')
  data = { sorted_todo_item_ids: data }

  unless _(data).isEqual(previousPositionUpdateData)
    $.post url, data

  previousPositionUpdateData = data

window.makeTodoListSortable = ($list) ->
  $list.sortable(
    connectWith: behavior_selector('sortable')
    update: updatePosition
  )


$ ->
  $b('sortable').each ->
    makeTodoListSortable $(this)
