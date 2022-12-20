module ReportHelper
	def report_min_value reports
		@reports.map(&:blood_reading).min
	end

	def report_max_value reports
		@reports.map(&:blood_reading).max
	end

	def report_avg_value reports
		@reports.map(&:blood_reading).sum.to_f / @reports.length
	end
end
