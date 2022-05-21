FactoryBot.define do
  factory :random_beer, class: Beer do
    sequence(:name) { |n| "#{Faker::Beer.name}#{n}" }
    inventory { Faker::Number.within(range: 5..25) }
  end
end