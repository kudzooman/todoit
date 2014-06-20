require 'faker'

3.times do
  List.create(
    name: Faker::Lorem.word
)
end
lists = List.all

15.times do
  Todo.create(
    list: lists.sample,
    item: Faker::Lorem.word
)
end

puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Todo.count} todos created"

