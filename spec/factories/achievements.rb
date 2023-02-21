FactoryBot.define do
  factory :achievement do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    points { Faker::Number.between(from: 1, to: 100) }
  end
end
