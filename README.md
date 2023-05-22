## Setup

# Database: (Postgresql)
- `rake db:setup`
- `rake db:migrate`

# Create default plans
- `rake db:seed`

## Acess

# See and manage Plans
- `/plans`

## API
- `/api/should_retain?plan={plan_name}&date={date}`

- Example: `/api/should_retain?plan=beginner&date=2023-04-09`

## Tests
Path: `spec/services/plan/should_retain_service_spec.rb`
Run: `rspec spec/services/plan/should_retain_service_spec.rb`

### Default valid plans
- Beginner
- Pro
- Ultra

### Date format
`2023/05/22`

--
## About the code
All plans are dynamic, so new plans can be created in visual interface.
