class ProjectsController < ApplicationController
  def index
    @projects = Project.last_updated
  end
end
