html = '<%= j render('results') %>'

$el = $('#search_results')
if $el.size()
  $el.replaceWith html
else
  $('body').append html