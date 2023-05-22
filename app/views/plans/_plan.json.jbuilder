json.extract! plan, :id, :name, :description, :daily_retention, :monthly_retention, :annual_retention, :created_at, :updated_at
json.url plan_url(plan, format: :json)
