$(document).on 'page:change', ->
  highligh = (i, block) ->
    hljs.highlightBlock(block)
  $('.content pre code').each highligh