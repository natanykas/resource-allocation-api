FactoryBot.define do
    factory :Schedule do
        room { Faker::Number.within(range: 1..10) }
        date { Faker::Date.between(from: '2021-04-05', to: '2021-04-11') }
        time_start { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
        time_end {  time_start +1.hour }
        user { create(:user) }
    end
end