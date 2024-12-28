FactoryBot.define do
  factory :workspace do
    name {Faker::Lorem.word}
    url {"https://www.lipsum.com/1234"}
    api_key {'94417c741911b869bb20b9e18d59bf8c9cc6f5ba'}
  end 
end
