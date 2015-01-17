class DropItemsController < ApplicationController
  def create
    todo_list = TodoList.find params[:todo_list_id]
    @todo_item = TodoItem.find drop_params[:todo_item_id]
    after_todo_item = TodoItem.where(id: drop_params[:after_todo_item_id]).first
    todo_list.drop_item(@todo_item, after: after_todo_item)
  end
  
  private
  
    def drop_params
      params.require(:drop).permit(:todo_item_id, :after_todo_item_id)
    end
end
