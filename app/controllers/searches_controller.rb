class SearchesController < ApplicationController
  def index
    @query = params[:q]
    @projects = Project.search @query
    @writings = Writing.search @query
  end
end
