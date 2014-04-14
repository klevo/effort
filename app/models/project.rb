class Project < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }

  has_many :todo_lists
  has_many :writings

  def to_param
    [id, name].join(' ').parameterize
  end

  def position_todo_lists_according_to sorted_todo_list_ids
    sorted_todo_list_ids.each_with_index do |todo_list_id, position|
      todo_lists.where(id: todo_list_id.to_i).update_all position: position
    end

    touch
  end
end
