require 'rails_helper'

RSpec.describe Resort do
  it {should belong_to :region}

  describe 'class methods' do
    it 'can return #only_true records' do
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
        active: false,
        director_operations: 'Doug Lowell',
        ttm_revenue_usd: 227373675)

      expected = Resort.only_true

      expect(expected.length).to eq(1)
      expect(expected.first).to eq(resort_1)
    end
  end

end
