require 'rails_helper'

RSpec.describe ShouldRetainService do

	describe 'Any plan' do
		context 'with' do
			it 'invalid Plan Name' do
				expect(ShouldRetainService.verify("", "")).to eq('Invalid Plan Name')
			end

			it 'invalid Date' do
				expect(ShouldRetainService.verify("Beginner", "")).to eq('invalid date')
			end
		end
	end

	describe 'Beginner plan' do
		context 'with date out of plan' do
			it 'daily' do
				expect(ShouldRetainService.verify("Beginner", (Date.today - 43.days).to_s)).to eq(false)
			end

			it 'montlhy' do
				expect(ShouldRetainService.verify("Beginner", (Date.today - 12.month).end_of_month.to_s)).to eq(false)
			end

			it 'year' do
				expect(ShouldRetainService.verify("Beginner", (Date.today - 12.month).end_of_year.to_s)).to eq(false)
			end
		end
	end

	describe 'Pro plan' do
		context 'with date out of plan' do
			it 'daily' do
				expect(ShouldRetainService.verify("Pro", (Date.today - 43.days).to_s)).to eq(false)
			end

			it 'montlhy' do
				expect(ShouldRetainService.verify("Pro", (Date.today - 13.month).end_of_month.to_s)).to eq(false)
			end

			it 'year' do
				expect(ShouldRetainService.verify("Pro", (Date.today - 12.month).end_of_year.to_s)).to eq(false)
			end
		end
	end

	describe 'Ultra plan' do
		context 'with date out of plan' do
			it 'daily' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 43.days).to_s)).to eq(false)
			end

			it 'montlhy' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 13.month).end_of_month.to_s)).to eq(false)
			end

			it 'year' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 8.years).end_of_year.to_s)).to eq(false)
			end
		end
	end

	describe 'Beginner plan' do
		context 'with valid date to retain' do
			it 'daily' do
				expect(ShouldRetainService.verify("Beginner", (Date.today - 42.days).to_s)).to eq(true)
			end
		end
	end

	describe 'Pro plan' do
		context 'with valid date to retain' do
			it 'daily' do
				expect(ShouldRetainService.verify("Pro", (Date.today - 42.days).to_s)).to eq(true)
			end

			it 'montlhy' do
				expect(ShouldRetainService.verify("Pro", (Date.today - 12.month).end_of_month.to_s)).to eq(true)
			end
		end
	end

	describe 'Ultra plan' do
		context 'with valid date to retain' do
			it 'daily' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 42.days).to_s)).to eq(true)
			end

			it 'montlhy' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 12.month).end_of_month.to_s)).to eq(true)
			end

			it 'year' do
				expect(ShouldRetainService.verify("Ultra", (Date.today - 7.years).end_of_year.to_s)).to eq(true)
			end
		end
	end
end
