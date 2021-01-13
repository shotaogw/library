FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'test1234TEST' }
    password_confirmation { password }
    profile { Faker::Lorem.sentence }
    birth_date { Faker::Date.birthday(min_age: 10, max_age: 80) }
  end
end