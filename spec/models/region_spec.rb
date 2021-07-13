require 'rails_helper'

RSpec.describe Region do
  it {should have_many :resorts}

  describe 'instance methods' do
    it 'can return child #resort_count' do
      region = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)
      resort_1 = region.resorts.create!(
        name: 'Crested Butte',
        country: 'United States',
        state_province: 'CO',
        active: true,
        director_operations: 'Molly Hauck',
        ttm_revenue_usd: 170530257)
      resort_2 = region.resorts.create!(
        name: 'Breckenridge',
        country: 'United States',
        state_province: 'CO',
        active: true,
        director_operations: 'Doug Lowell',
        ttm_revenue_usd: 227373675)

      expect(region.resort_count).to eq(2)
    end
  end

  describe 'class methods' do
    it 'can return all parents #ordered_by_created_date' do
      region_1 = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)
      region_2 = Region.create!(
        name: 'LATAM',
        active: false,
        rvp_operations: 'Gustavo Fring',
        priority: 3)

      expected = Region.ordered_by_created_date

      expect(expected.length).to eq(2)
      expect(expected.first).to eq(region_2)
      expect(expected.last).to eq(region_1)
    end
  end

end
