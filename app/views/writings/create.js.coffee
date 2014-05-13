# $(document).once 'page:change', ->
#   console.info "Focusing #{$('#writing_content').html()}"
#   $('#writing_content').focus()
  
Turbolinks.visit '<%= edit_project_writing_path(@writing.project, @writing) %>'