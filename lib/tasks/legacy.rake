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
        project.todo_lists.create!(
          name: legacy_todo_list.name,
          position: legacy_todo_list.order,
          created_at: legacy_todo_list.created,
          updated_at: legacy_todo_list.updated,
        )
        puts "   -> Created TodoList: #{legacy_todo_list.name}"
      end


    end
  end
end
