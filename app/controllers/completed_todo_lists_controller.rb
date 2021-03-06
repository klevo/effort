class CompletedTodoListsController < ApplicationController
  before_action :set_project

  def index
    @todo_lists = @project.todo_lists.completed.last_updated
    @pending_todo_lists_count = @project.todo_lists.pending.count
  end
end
