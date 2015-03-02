module ApplicationHelper
  def create_page_title
    if @writing
      "#{@writing.title} ❮ #{@writing.project.name} ❮ Projects"
    elsif @project
      "#{@project.name} ❮ Projects"
    else
      'Projects'
    end
  end
end
