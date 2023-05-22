# Create Plans
Plan.create!(
	name: 'Beginner',
	description: 'Starter Period: 42 days',
	daily_retention: 42,
	monthly_retention: 0,
	annual_retention: 0
)

Plan.create!(
	name: 'Pro',
	description: 'Retention Period: 42 days and 12 months',
	daily_retention: 42,
	monthly_retention: 12,
	annual_retention: 0
)

Plan.create!(
	name: 'Ultra',
	description: 'Retention Period: 42 days, 12 months and 7 years',
	daily_retention: 42,
	monthly_retention: 12,
	annual_retention: 7
)
