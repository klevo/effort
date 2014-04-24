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
end
