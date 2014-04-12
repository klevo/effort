class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: %w(new create position)

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_item = @todo_list.todo_items.new todo_item_params
    unless @todo_item.save
      render 'not_created'
    end
  end

  def position
    @todo_list.position_todo_items_according_to params[:sorted_todo_item_ids]
    render nothing: true
  end

  def toggle
    @todo_item.toggle
  end

  def destroy
    @todo_item.destroy
  end

  def edit
  end

  def cancel_edit
  end

  def update
    @todo_item.update todo_item_params
  end

  private

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end

    def set_todo_list
      @todo_list = TodoList.find params[:todo_list_id]
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find params[:id]
    end
end
