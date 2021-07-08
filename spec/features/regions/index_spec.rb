require 'rails_helper'

RSpec.describe 'regions index page' do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'can display all of the region names' do
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

    visit "/regions"
    # save_and_open_page

    expect(page).to have_content(region_1.name)
    expect(page).to have_content(region_2.name)
  end

  it 'links to each region page' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit "/regions"
    click_on region.name

    expect(current_path).to eq("/regions/#{region.id}")
  end

end
