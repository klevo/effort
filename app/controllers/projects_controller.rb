class ProjectsController < ApplicationController
  before_action :set_project, only: %w(show)

  def index
    @projects = Project.last_updated
    @project = Project.new
  end

  def show
    throw "show is not used, go to :todo_lists of this project"
  end
  
  def create
    @project = Project.new(project_params)
    @project.save!
    redirect_to project_todo_lists_path(@project)
  end

  private

    def set_project
      @project = Project.find params[:id]
    end
    
    def project_params
      params.require(:project).permit(:name)
    end
end
