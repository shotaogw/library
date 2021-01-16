FactoryBot.define do
  factory :word do
    name { Faker::Lorem.words }
    info { Faker::Lorem.sentence }
    association :user
    association :book
  end
end
