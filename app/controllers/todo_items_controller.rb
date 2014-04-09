class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @todo_item = @todo_list.todo_items.new todo_item_params
    @todo_item.save!
  end

  def toggle
    @todo_item = @todo_list.todo_items.find params[:id]
    @todo_item.toggle
  end

  private

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end

    def set_todo_list
      @todo_list = TodoList.find params[:todo_list_id]
    end
end
