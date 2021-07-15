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

    it 'can sort children via #sort_resorts_alphabetically' do
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

      expected = region.sort_resorts_alphabetically

      expect(expected.length).to eq(2)
      expect(expected.first).to eq(resort_2)
      expect(expected.last).to eq(resort_1)
    end

    it 'can filter resorts by minimum revenue threshold' do
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

      expected = region.filter_resorts_by(200)

      expect(expected.length).to eq(1)
      expect(expected.first).to eq(resort_2)
    end
  end

  describe 'class methods' do
    it 'can return all regions #ordered_by_created_date' do
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
    it 'can sort all regions by #resort_count' do
      region_1 = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)
      resort_1 = region_1.resorts.create!(
        name: 'Crested Butte',
        country: 'United States',
        state_province: 'CO',
        active: true,
        director_operations: 'Molly Hauck',
        ttm_revenue_usd: 170530257)
      resort_2 = region_1.resorts.create!(
        name: 'Breckenridge',
        country: 'United States',
        state_province: 'CO',
        active: true,
        director_operations: 'Doug Lowell',
        ttm_revenue_usd: 227373675)

      region_2 = Region.create!(
        name: 'LATAM',
        active: false,
        rvp_operations: 'Gustavo Fring',
        priority: 3)
      region_2.resorts.create!(
        name: 'Cerro Castor',
        country: 'Argentina',
        state_province: 'Tierra del Fuego',
        active: false,
        director_operations: 'Diego Velun',
        ttm_revenue_usd: 0)

      expected = Region.sorted_by_resort_count

      expect(expected.length).to eq(2)
      expect(expected.first).to eq(region_1)
      expect(expected.last).to eq(region_2)
    end
  end

end
