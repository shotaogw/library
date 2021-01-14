FactoryBot.define do
  factory :book do
    title { Faker::Lorem.words }
    genre_id { 7 }
    association :user
  end
end
