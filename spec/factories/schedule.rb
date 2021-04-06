FactoryBot.define do
  factory :Schedule do
    room { Faker::Number.within(range: 1..4) }
    date { Faker::Date.between(from: '2021-04-01', to: '2021-04-30') }
    time_start { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    time_end { time_start + 1.hour }
    user { create(:User) }
  end
end
