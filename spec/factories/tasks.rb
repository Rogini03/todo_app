FactoryBot.define do
  factory :task do
    title { Faker::Job.title }
    due_date {Faker::Date.between(from: '2024/01/01', to: '2025/12/31').strftime("%d/%m/%Y")}
    assignee {2}
    priority {rand(1..5)}
    user
    category
  end
end