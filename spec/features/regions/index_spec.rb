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

  # User Story 17, Parent Update From Parent Index Page (x3)
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
  it 'links to the region edit page' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)

    visit '/regions'
    # save_and_open_page
    click_on 'Update Region'

    expect(current_path).to eq("/regions/#{region.id}/edit")
  end

  # User Story 22, Parent Delete From Parent Index Page (x1)
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
  it 'can delete the resort' do
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

    visit '/regions'
    # save_and_open_page

    click_on 'Delete Region'
    expect(current_path).to eq('/regions')

    visit '/regions'
    # save_and_open_page
    expect(page).to_not have_content(resort.name)
  end

  # Extension:
  # Sort Parents by Number of Children (x3)
    # As a visitor
    # When I visit the Parents Index Page
    # Then I see a link to sort parents by the number of `child_table_name` they have
    # When I click on the link
    # I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
  it 'can sort regions by resort count' do
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

    visit '/regions'
    # save_and_open_page
    expect(page).to have_content("Total Resorts: #{region_1.resort_count}")
    expect(page).to have_content("Total Resorts: #{region_2.resort_count}")

    click_on 'Sort by Resort Count'
    expect(current_path).to eq('/regions')
    expect(region_1.name).to appear_before(region_2.name)
  end

end
