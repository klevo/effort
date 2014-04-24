class WritingsController < ApplicationController
  before_action :set_project

  def index
    @writings = @project.writings.latest
  end

  def show
    @writing = @project.writings.find params[:id]
  end

  def new
    @writing = @project.writings.new
  end

  def create
    @writing = @project.writings.new writing_params
    if @writing.save
      redirect_to edit_project_writing_path(@project, @writing)
    else
      render :edit
    end
  end

  def edit
    @writing = @project.writings.find params[:id]
  end

  def update
    @writing = @project.writings.find params[:id]
    if @writing.update writing_params
      redirect_to edit_project_writing_path(@project, @writing)
    else
      render :edit
    end
  end

  def destroy
    @writing = @project.writings.find params[:id]
    @writing.destroy
    redirect_to [@project, :writings]
  end

  private

    def writing_params
      params.require(:writing).permit(:title, :content)
    end
end
