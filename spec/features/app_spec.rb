require 'rails_helper'

RSpec.describe 'application layout' do
# User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  describe 'links to all child indexes' do
    it 'links to trails index' do
      park = Park.create!(name: "North Table Mountain",
                          state: "CO",
                          county: "Jefferson",
                          parking_fee: 0,
                          dogs_allowed: true)

      visit "/parks"
      # save_and_open_page

      click_on "Trails Index"
      expect(current_path).to eq("/trails")

      visit "/regions"
      click_on "Trails Index"
      expect(current_path).to eq("/trails")
    end
    it 'links to resorts index' do
      region = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)

      visit "/regions"
      # save_and_open_page

      click_on "Resorts Index"
      expect(current_path).to eq("/resorts")

      visit "/parks"
      click_on "Resorts Index"
      expect(current_path).to eq("/resorts")
    end
    xit 'links to skis index' do
      # stuff
    end
  end

# User Story 9, Parent Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  describe 'links to all parent indexes' do
    it 'links to parks index' do
      park = Park.create!(name: "North Table Mountain",
                          state: "CO",
                          county: "Jefferson",
                          parking_fee: 0,
                          dogs_allowed: true)
      trail = park.trails.create!(name: "North Table Loop",
                            length: 38016,
                            elevation_gain: 1059,
                            loop: true)

      visit "/trails"
      # save_and_open_page

      click_on "Parks Index"
      expect(current_path).to eq("/parks")

      visit "/resorts"
      click_on "Parks Index"
      expect(current_path).to eq("/parks")
    end
    it 'links to regions index' do
      region = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)
      resort = region.resorts.create!(
        name: 'Crested Butte',
        country: 'United States',
        state_province: 'CO',
        active: true,
        director_operations: 'Molly Hauck',
        ttm_revenue_usd: 170530257)

      visit "/resorts"
      # save_and_open_page

      click_on "Regions Index"
      expect(current_path).to eq("/regions")

      visit "/parks"
      click_on "Regions Index"
      expect(current_path).to eq("/regions")
    end
    xit 'links to ski brands index' do
      # stuff
    end
  end

end
