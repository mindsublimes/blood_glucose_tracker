class GlucoseReading < ApplicationRecord
	belongs_to :user
	enum measure_unit: %i[mg/dl]

	FILTERS_VALUE = [["Daily", "daily"],["Month to Date", "date_range"], ["Monthly", "monthly"]]


	def self.today_report
		where('reading_time BETWEEN ? AND ?', Time.now.beginning_of_day, Time.now.end_of_day)
	end

	def self.montly_report
		where('reading_time BETWEEN ? AND ?', (Time.now - 1.month).beginning_of_day, Time.now)
	end

	def self.custom_month_report(time)
		where('reading_time BETWEEN ? AND ?', time.to_time.beginning_of_month.beginning_of_day, time)
	end
end
