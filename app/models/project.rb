class Project < ActiveRecord::Base
  scope :last_updated, -> { order updated_at: :desc }

  has_many :todo_lists
  has_many :writings
  
  validates_presence_of :name

  def to_param
    [id, name].join(' ').parameterize
  end

  def position_todo_lists_according_to sorted_todo_list_ids
    sorted_todo_list_ids.each_with_index do |todo_list_id, position|
      todo_lists.where(id: todo_list_id.to_i).update_all position: position
    end

    touch
  end
  
  def self.search(query)
    find_by_sql [%{
      SELECT id, name, created_at, updated_at, MATCH (name) AGAINST (?) AS score 
      FROM projects 
      WHERE MATCH (name) AGAINST (?) > 0 OR name LIKE ?
      ORDER BY score DESC, updated_at DESC
      LIMIT 50}, query, query, "%#{query}%"]
  end
end
