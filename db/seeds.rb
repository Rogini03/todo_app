# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
Category.destroy_all
Task.destroy_all
User.destroy_all
(1..20).each do |id|
    User.create!(
        email: Faker::Internet.email,
        password: "password", 
    )
end
p "Created #{User.count} users"
#create category
(1..20).each do |id|
    Category.create!(
        id: id, 
        name: Faker::Lorem.word
    )
end
p "Created #{Category.count} categories"

#create task
(1..20).each do |id|
    Task.create!(
        id: id, 
        title: Faker::Job.title,
        description: Faker::Lorem.paragraphs,
        due_date: rand((DateTime.now - 3.days)..DateTime.now),
        priority: rand(1..5),
        remind_me_before_at: rand((DateTime.now - 2.days)..DateTime.now),
        completion_status: false,
        user_id: rand(User.ids.first..User.ids.last),
        assignee: rand(User.ids.first..User.ids.last),
        category_id: rand(1..10)
    )
end
p "Created #{Task.count} tasks"
