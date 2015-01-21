namespace :todo_lists do
  task reassess_completion: :environment do
    TodoList.find_each do |todo_list|
      todo_list.reassess_completion
      puts " -> '#{todo_list.name}' - complete: #{todo_list.complete?}"
    end
    
    puts " -> Done. #{TodoList.count} todo lists reassesed."
  end
  
  task fix_todo_item_positions: :environment do
    TodoList.find_each do |todo_list|
      todo_list.todo_items.positioned.each_with_index do |todo_item, index|
        TodoItem.where(id: todo_item.id).update_all position: index + 1
      end
      puts " -> '#{todo_list.name}' - adjusted TotoItem positions"
    end
  end 
end