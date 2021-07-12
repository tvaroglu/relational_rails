require 'rails_helper'

RSpec.describe 'regions index page' do
  # User Story 1, Parent Index (x3)
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
  # User Story 6, Parent Index sorted by Most Recently Created (x3)
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
  it 'can display all of the region names sorted descending by most recently created' do
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

    visit '/regions'
    # save_and_open_page

    expect(page).to have_content(region_1.name)
    expect(page).to have_content(region_1.created_at)
    expect(page).to have_content(region_2.name)
    expect(page).to have_content(region_2.created_at)

    expect(region_2.name).to appear_before(region_1.name)
  end

  it 'links to each region page' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit '/regions'
    # save_and_open_page
    click_on region.name

    expect(current_path).to eq("/regions/#{region.id}")
  end

end
