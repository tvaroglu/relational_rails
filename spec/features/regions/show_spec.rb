require 'rails_helper'

RSpec.describe 'region show page' do
  # User Story 2, Parent Show (x3)
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
  it 'displays the region title' do
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

    expect(page).to have_content(region.name)
    expect(page).to have_content("Priority: #{region.priority}")
    expect(page).to have_content("Currently Active: #{region.active}")
    expect(page).to have_content("RVP of Operations: #{region.rvp_operations}")
    expect(page).to have_content("Created At: #{region.created_at}")
    expect(page).to have_content("Last Updated At: #{region.updated_at}")
  end

  it 'displays a link to return to the parent index from the show page' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit "/regions/#{region.id}"
    # save_and_open_page

    click_link 'Regions Index'
    expect(current_path).to eq('/regions')
  end

end
