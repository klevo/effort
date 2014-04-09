class ProjectsController < ApplicationController
  def index
    @projects = Project.last_updated
  end

  def show
    @project = Project.find params[:id]
  end
end
