class DropItemsController < ApplicationController
  def create
    @todo_list = TodoList.find params[:todo_list_id]
    @todo_item = TodoItem.find drop_params[:todo_item_id]
  end
  
  private
  
    def drop_params
      params.require(:drop).permit(:todo_item_id, :after_todo_item_id)
    end
end
