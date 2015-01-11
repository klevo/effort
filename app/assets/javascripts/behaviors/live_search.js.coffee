$(document).on 'search', behaviorSelector('live_search'), (event) ->
  $search = $ this
  console.info "Searching for #{$search.val()}"
