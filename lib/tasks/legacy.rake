namespace :legacy do
  task import: :environment do
    puts " -> Importing projects, todo lists and messages from Todo.dev"

    Legacy::Project.find_each do |legacy_project|
      puts " -> Importing project: #{legacy_project.name}"
      project = Project.create!(
        name: legacy_project.name,
        created_at: legacy_project.created,
        updated_at: legacy_project.created
      )

      legacy_project.messages.find_each do |legacy_message|
        project.writings.create!(
          title: legacy_message.title,
          content: legacy_message.body,
          created_at: legacy_message.created,
          updated_at: legacy_message.updated,
        )
        puts "   -> Created Writing: #{legacy_message.title}"
      end

      legacy_project.todo_lists.find_each do |legacy_todo_list|
        todo_list = project.todo_lists.build(
          name: legacy_todo_list.name,
          position: legacy_todo_list.order,
          created_at: legacy_todo_list.created,
          updated_at: legacy_todo_list.updated
        )
        puts "   -> TodoList: #{legacy_todo_list.name}"
        legacy_todo_list.todo_items.find_each do |legacy_todo_item|
          todo_list.todo_items.build(
            content: legacy_todo_item.content,
            is_done: legacy_todo_item.is_done,
            created_at: legacy_todo_item.created,
            updated_at: legacy_todo_item.updated
          )
          puts "     -> TodoItem: #{legacy_todo_item.content}"
        end
        todo_list.save!
        todo_list.update(
          created_at: legacy_todo_list.created,
          updated_at: legacy_todo_list.updated
        )

        project.update(
          created_at: legacy_project.created,
          updated_at: project.todo_lists.order(updated_at: :desc).try(:updated_at) || legacy_project.created
        )
      end
    end
  end
end
