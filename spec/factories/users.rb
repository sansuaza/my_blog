FactoryBot.define do
  factory :user do
    first_name {Faker::Name.unique.first_name}
    last_name {Faker::Name.unique.last_name}
    sequence(:email) { |n| "person#{n}@example.com" }
    password {'123456'}
    sequence(:username) { |n| "usernumber#{n}" }
  end
end
