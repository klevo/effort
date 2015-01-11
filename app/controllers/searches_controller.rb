class SearchesController < ApplicationController
  def index
    @query = params[:q]
  end
end
