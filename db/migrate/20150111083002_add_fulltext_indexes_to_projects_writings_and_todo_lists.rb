class AddFulltextIndexesToProjectsWritingsAndTodoLists < ActiveRecord::Migration
  def change
    execute "ALTER TABLE projects ADD FULLTEXT KEY (name)"
    execute "ALTER TABLE todo_lists ADD FULLTEXT KEY (name)"
    execute "ALTER TABLE writings ADD FULLTEXT KEY (title, content)"
  end
end
