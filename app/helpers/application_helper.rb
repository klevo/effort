module ApplicationHelper
  def create_page_title
    if @project
      @project.name
    else
      'Projects'
    end
  end
end
