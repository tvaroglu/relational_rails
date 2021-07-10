require 'rails_helper'

RSpec.describe "region's resorts index" do
  # User Story 5, Parent Children Index (x3)
  #   As a visitor
  #   When I visit '/parents/:parent_id/child_table_name'
  #   Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'displays the associated resort names and attributes' do
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

    visit "/regions/#{region.id}/resorts"
    # save_and_open_page

    expect(page).to have_content(resort_1.name)
    expect(page).to have_content("Country: #{resort_1.country}")
    expect(page).to have_content("State/Province: #{resort_1.state_province}")
    expect(page).to have_content("Currently Active: #{resort_1.active}")
    expect(page).to have_content("Director of Operations: #{resort_1.director_operations}")
    expect(page).to have_content("Last 12 Months Total Revenue ($MM): #{(resort_1.ttm_revenue_usd / 1000000.to_f).round(1)}")
    expect(page).to have_content("Created At: #{resort_1.created_at}")
    expect(page).to have_content("Last Updated At: #{resort_1.updated_at}")

    expect(page).to have_content(resort_2.name)
    expect(page).to have_content("Country: #{resort_2.country}")
    expect(page).to have_content("State/Province: #{resort_2.state_province}")
    expect(page).to have_content("Currently Active: #{resort_2.active}")
    expect(page).to have_content("Director of Operations: #{resort_2.director_operations}")
    expect(page).to have_content("Last 12 Months Total Revenue ($MM): #{(resort_2.ttm_revenue_usd / 1000000.to_f).round(1)}")
    expect(page).to have_content("Created At: #{resort_2.created_at}")
    expect(page).to have_content("Last Updated At: #{resort_2.updated_at}")
  end

  it 'links to each resort page' do
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

    visit "/regions/#{region.id}/resorts"
    # save_and_open_page
    click_on resort.name

    expect(current_path).to eq("/resorts/#{resort.id}")
  end

  it 'links back to the parent region page' do
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

    visit "/regions/#{region.id}/resorts"
    # save_and_open_page
    click_on region.name

    expect(current_path).to eq("/regions/#{region.id}")
  end

  it 'displays a button to return to the parent index from the show page' do
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

    visit "/regions/#{region.id}/resorts"
    # save_and_open_page
    click_button 'Regions Index'

    expect(current_path).to eq('/regions')
  end

end