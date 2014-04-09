class ProjectsController < ApplicationController
  before_action :set_project, only: %w(show)

  def index
    @projects = Project.last_updated
  end

  def show
  end
end
