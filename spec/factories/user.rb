FactoryBot.define do
  factory :User do
    name { Faker::Name.name }
  end
end
