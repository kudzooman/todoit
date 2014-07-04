# desc "Delete all todos older than 7 days"
task :delete_old_todos => :environment do
  Todo.where("created_at < ?", 7.days.ago).destroy_all
  puts "Old todos deleted!"
end