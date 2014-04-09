class TodoListsController < ApplicationController
  before_action :set_project

  def set_project
    @project = Project.find params[:project_id]
  end
end
