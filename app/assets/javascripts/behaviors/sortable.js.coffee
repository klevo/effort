class @SortableList
  lastTodoItemPositionsUpdateData: {}
  lastTodoListPositionsUpdateData: {}

  constructor: ($list) ->
    updateFunctionName = $list.data('position-update-function')
    
    sortableOptions = {
      update: @[updateFunctionName]
      cursor: 'move'
      handle: behaviorSelector('sort_handle')
      axis: 'y'
      start: (event, ui) ->
        if ui.helper.hasClass('todo_list')
          ui.helper.addClass 'being_dragged'

          # We want tall todo lists to be short while dragging so we see what we're doing
          ui.helper.height(120)
          $('.ui-sortable-placeholder').height(150)
      stop: (event, ui) ->
        $('.being_dragged').removeClass 'being_dragged'
    }
    
    connectWith = $list.data('connect-sortable-with')
    if connectWith 
      sortableOptions['connectWith'] = connectWith
    
    $list.sortable sortableOptions

  updateTodoItemPositions: (event, ui) =>
    $todoList = ui.item.closest '.todo_list'
    $items = $todoList.find('.items')

    # Prepare an array of TodoItem IDs in order as they appear on the screen
    data = []

    # If this is the event happening on the list that send this item,
    # we send empty array of data, that means that the original todo list should just be touched
    unless ui.sender
      $items.find('.todo_item').each ->
        id_attr = $(this).attr('id')
        id = _(id_attr.split('_')).last()
        data.push id

    # ...params format Rails controller expects
    data = { sorted_todo_item_ids: data }

    url = $items.data('position-url')
    $.post url, data

  updateTodoListPositions: (event, ui) =>
    $items = $('section.todo_lists')

    # Prepare an array of TodoItem IDs in order as they appear on the screen
    data = []
    $items.find('.todo_list').each ->
      id_attr = $(this).attr('id')
      id = _(id_attr.split('_')).last()
      data.push id

    # ...params format Rails controller expects
    data = { sorted_todo_list_ids: data }

    # If the data has changed from the last update, submit it to the server
    unless _(data).isEqual(@lastTodoListPositionsUpdateData)
      url = $items.data('position-url')
      $.post url, data

    @lastTodoListPositionsUpdateData = data

  @initializeAll: ->
    $b('sortable').each ->
      new SortableList($(this))


$(document).on 'page:change', ->
  SortableList.initializeAll()
