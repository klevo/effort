class TodoListsController < ApplicationController
  before_action :set_project
  before_action :set_todo_list, except: %w(index new create position)

  def index
    @todo_lists = @project.todo_lists.pending.positioned
    @completed_todo_lists_count = @project.todo_lists.completed.count
  end
  
  def show_all_items
    @todo_items = @todo_list.todo_items.completed.last_updated
  end

  def new
    @todo_list = @project.todo_lists.new
  end

  def create
    @todo_list = @project.todo_lists.new(todo_list_params)
    @todo_list.save!
  end

  def position
    @project.position_todo_lists_according_to params[:sorted_todo_list_ids]
    render nothing: true
  end

  def destroy
    @todo_list.destroy
  end

  def edit
  end

  def update
    @todo_list.update todo_list_params
  end

  def cancel_edit
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end

    def set_todo_list
      @todo_list = @project.todo_lists.find params[:id]
    end
end
