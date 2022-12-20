class ReportsController < ApplicationController

	def index
		@reports = current_user.glucose_readings.today_report
	end


	def filter_report
		if params[:filter] == "date_range" && !params[:date].present?
			flash[:alert] = "Please select date to continue"
			redirect_to reports_path
			return
		end

		@reports = 
			if params[:filter] == "daily"
				current_user.glucose_readings.today_report
			elsif params[:filter] == "monthly"
				current_user.glucose_readings.montly_report
			elsif params[:filter] == "date_range"
				current_user.glucose_readings.custom_month_report(params[:date])
			end
				
		respond_to do |format|
			format.js
		end
	end
end