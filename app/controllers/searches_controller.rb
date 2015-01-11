class SearchesController < ApplicationController
  def index
    @query = params[:q]
    @projects = Project.search @query
  end
end
