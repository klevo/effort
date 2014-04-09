class TodoListsController < ApplicationController
  before_action :set_project

  def new
    @todo_list = @project.todo_lists.new
  end

  private

    def set_project
      @project = Project.find params[:project_id]
    end
end
