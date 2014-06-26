desc "Delete all todos older than 7 days"
task :delete_old_todos => :environment do
  Todo.destroy_all("marked = ? AND created_at < ?", false, 7.days.ago)
end