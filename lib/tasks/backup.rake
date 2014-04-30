namespace :backup do
  task db: :environment do
    target_path = Rails.root.join('tmp', 'backup', "effort_development_#{Time.zone.now.strftime('%Y%m%dT%H%M')}.sql")
    cmd = "mysqldump effort_development > #{target_path}"
    puts " -> #{cmd}"
    system cmd
    size = `du -sh #{target_path}`
    puts " -> Size: #{size}"
  end
end