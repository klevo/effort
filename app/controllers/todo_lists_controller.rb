class TodoListsController < ApplicationController
  before_action :set_project

  def create
    @todo_list = @project.todo_lists.new(todo_list_params)
    @todo_list.save!
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end

    def set_project
      @project = Project.find params[:project_id]
    end
end
