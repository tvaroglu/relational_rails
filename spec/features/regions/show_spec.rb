require 'rails_helper'

RSpec.describe 'region show page' do
  # User Story 2, Parent Show (x3)
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
  it 'displays the region name' do
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

    visit "/regions/#{region_1.id}"
    # save_and_open_page

    expect(page).to have_content(region_1.name)
    expect(page).to_not have_content(region_2.name)
  end

  it 'displays the attributes of the region' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit "/regions/#{region.id}"
    # save_and_open_page

    expect(page).to have_content("Region: #{region.name}")
    expect(page).to have_content("Priority: #{region.priority}")
    expect(page).to have_content("Currently Active: #{region.active}")
    expect(page).to have_content("RVP of Operations: #{region.rvp_operations}")
    expect(page).to have_content("Created At: #{region.created_at}")
    expect(page).to have_content("Last Updated At: #{region.updated_at}")
  end

  describe 'display a link to the associated children with total children count' do
  # User Story 7, Parent Child Count (x3)
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    it 'displays correct grammar if more than one child is associated to the parent' do
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

      visit "/regions/#{region.id}"
      # save_and_open_page

      click_link "View All (#{region.resorts.length}) Resorts"
      expect(current_path).to eq("/regions/#{region.id}/resorts")
    end

    it 'displays correct grammar if only one child is associated to the parent' do
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

      visit "/regions/#{region.id}"
      # save_and_open_page

      click_link "View All (#{region.resorts.length}) Resort"
      expect(current_path).to eq("/regions/#{region.id}/resorts")
    end
  end

# User Story 10, Parent Child Index Link
  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it 'shows link to the regions index' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit "/regions/#{region.id}"
    # save_and_open_page

    click_on "View All (#{region.resorts.length}) Resorts"
    expect(current_path).to eq("/regions/#{region.id}/resorts")
  end

end
