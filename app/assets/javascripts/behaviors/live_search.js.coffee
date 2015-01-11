class SearchEngine
  constructor: (options) ->
    @url = options.url
    console.info "initialized search with url: #{@url}"
    @searchRequest = null
  
  search: (query) ->
    console.info "Searching for #{query}"
    
  cancelSearch: ->
    console.info 'Cancelling search.'
  

$ ->
  url = $(behaviorSelector('live_search')).parents('form').attr('action')
  window.searchEverything = new SearchEngine(url: url)

$(document).on 'search', behaviorSelector('live_search'), (event) ->
  $search = $ this
  query = $search.val().trim()
  if query.length > 2
    window.searchEverything.search(query)
  else
    window.searchEverything.cancelSearch()
  
