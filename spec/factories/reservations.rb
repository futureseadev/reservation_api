FactoryBot.define do
  factory :reservation do
    user
    vehicle
    start_time { '2020-07-20 15:27:06' }
    end_time { '2020-07-21 15:27:06' }
  end
end
