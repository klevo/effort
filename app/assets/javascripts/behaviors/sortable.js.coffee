class @SortableList
  lastTodoItemPositionsUpdateData: {}

  constructor: ($list) ->
    $list.sortable(
      connectWith: $list.data('connect-sortable-with')
      update: @updateTodoItemPositions
      cursor: 'move'
      handle: behaviorSelector('sort_handle')
      axis: 'y'
    )

  updateTodoItemPositions: (event, ui) =>
    $todoList = ui.item.closest '.todo_list'
    $items = $todoList.find('.items')

    # Prepare an array of TodoItem IDs in order as they appear on the screen
    data = []
    $items.find('.todo_item').each ->
      id_attr = $(this).attr('id')
      id = _(id_attr.split('_')).last()
      data.push id

    # ...params format Rails controller expects
    data = { sorted_todo_item_ids: data }

    # If the data has changed from the last update, submit it to the server
    unless _(data).isEqual(@lastTodoItemPositionsUpdateData)
      url = $items.data('position-url')
      $.post url, data

    @lastTodoItemPositionsUpdateData = data

  @initializeAll: ->
    $b('sortable').each ->
      new SortableList($(this))


$(document).on 'page:change', ->
  SortableList.initializeAll()
