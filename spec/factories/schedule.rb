FactoryBot.define do
    factory :Schedule do
        room { Faker::Number.within(range: 1..10) }
        date { Faker::Date.between(from: '2021-04-05', to: '2021-04-11') }
        time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
        user { create(:user) }
    end
end