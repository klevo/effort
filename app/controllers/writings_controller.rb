class WritingsController < ApplicationController
  before_action :set_project

  def index
    @writings = @project.writings.latest
  end
end
