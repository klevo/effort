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

      
    end
  end
end
