# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "test_user@gmail.com", password: "123456")


# blood reading data for today
[100,210,12,99].each do |t| 
	GlucoseReading.create(blood_reading: t , reading_time: Time.now, user_id: user.id)
end

# blood reading data form yesterday
[11,221,120,199].each do |t| 
	GlucoseReading.create(blood_reading: t , reading_time: Time.now - 1.day, user_id: user.id)
end

# blood reading for previous month
[110,122,201,199].each do |t| 
	GlucoseReading.create(blood_reading: t , reading_time: Time.now.prev_month, user_id: user.id)
end

# blood reading for first day of month
[10,12,21,19].each do |t| 
	GlucoseReading.create(blood_reading: t , reading_time: Time.now.beginning_of_month, user_id: user.id)
end

