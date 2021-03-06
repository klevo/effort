class SearchEngine
  constructor: (options) ->
    @url = options.url
    @resultsSelector = options.resultsSelector
    # console.info "initialized search with url: #{@url}"
    @searchRequest = null
  
  search: (query) ->
    @cancelSearchRequest()
    # console.info "Searching for #{query}"
    @searchRequest = $.ajax(
      type: "GET",
      url: @url,
      data: { q: query },
    )
    
  cancelSearch: ->
    @cancelSearchRequest()
    $(@resultsSelector).remove()
    # console.info 'Cancelling search.'
    
  cancelSearchRequest: ->
    if @searchRequest
      @searchRequest.abort()
      @searchRequest = null
    

$ ->
  url = $(behaviorSelector('live_search')).parents('form').attr('action')
  window.searchEverything = new SearchEngine(url: url, resultsSelector: '#search_results')

$(document).on 'search', behaviorSelector('live_search'), (event) ->
  $search = $ this
  query = $search.val().trim()
  if query.length > 2
    window.searchEverything.search(query)
  else
    window.searchEverything.cancelSearch()
  
