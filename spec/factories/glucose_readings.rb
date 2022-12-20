FactoryBot.define do
  factory :glucose_reading do
    user
    blood_reading {1}
    reading_time {"2022-12-19 06:01:01.000000000 +0000"}
  end
end
