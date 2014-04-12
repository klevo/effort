class TodoListsController < ApplicationController
  before_action :set_project
  before_action :set_todo_list, except: %w(create)

  def create
    @todo_list = @project.todo_lists.new(todo_list_params)
    @todo_list.save!
  end

  def destroy
    @todo_list.destroy
  end

  def edit
  end

  def update
    @todo_list.update todo_list_params
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end

    def set_project
      @project = Project.find params[:project_id]
    end

    def set_todo_list
      @todo_list = @project.todo_lists.find params[:id]
    end
end
