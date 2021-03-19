FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Articulo de #{n}" }
    body { Faker::Lorem.sentence }
    association :owner_id, factory: :user
  end
end
