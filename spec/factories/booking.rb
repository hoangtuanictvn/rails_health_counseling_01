FactoryBot.define do
  factory :booking do
    title {Faker::Job.title}
    reason {Faker::Lorem.unique}
    start_time {Faker::Time.between DateTime.now - 2, DateTime.now}
    stop_time {Faker::Time.between DateTime.now, DateTime.now + 2}
  end
end
