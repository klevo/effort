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
    @writing.save
  end

  def edit
    @writing = @project.writings.find params[:id]
  end

  def update
    @writing = @project.writings.find params[:id]
    @writing.update writing_params
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
