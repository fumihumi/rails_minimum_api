FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Name.middle_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end
