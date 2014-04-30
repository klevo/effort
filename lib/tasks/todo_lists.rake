namespace :todo_lists do
  task reasses_completion: :environment do
    TodoList.find_each do |todo_list|
      todo_list.reasses_completion
      puts " -> '#{todo_list.name}' - complete: #{todo_list.complete?}"
    end
    
    puts " -> Done. #{TodoList.count} todo lists reassesed."
  end
end