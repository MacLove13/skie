require 'time'

class ShouldRetainService
	def self.verify(plan_name, date)
		begin
			return 'Invalid Plan Name' if plan_name.nil?

			plan = get_plan(plan_name)
			return 'Invalid Plan Name' if plan.nil?

			return 'Invalid Date' if date.nil?
			date = Date.parse(date)

			today = Date.today
			last_monthly_day = date.end_of_month
			
			return true if in_daily_safe_range?(plan, date, today)

			retain = in_daily_safe_range?(plan, date, today)

			if last_day_of_year?(date)
				retain = in_year_safe_range?(plan, date, today)
			elsif is_last_monthly_day?(date)
				retain = in_montlhy_safe_range?(plan, date, today)
			end

			retain
		rescue => e
			puts e.backtrace
			e.message
		end
	end

	private

	def self.get_plan(plan_name)
		Plan.find_by(name: plan_name)
	end

	def self.is_last_monthly_day?(date)
		date.end_of_month == date
	end

	def self.last_day_of_year?(date)
		return false if date.month != 12
		date.end_of_month == date
	end

	def self.in_daily_safe_range?(plan, date, today)
		return date >= (today - plan.daily_retention.days)
	end

	def self.in_montlhy_safe_range?(plan, date, today)
		date >= (today - plan.monthly_retention.months)
	end

	def self.in_year_safe_range?(plan, date, today)
		retain = date >= (today - plan.annual_retention.years)
	end
end
