require 'rails_helper'

RSpec.describe 'resorts index page' do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'can display all of the children attributes' do
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

    visit "/resorts"
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

    visit "/resorts"
    click_on resort.name

    expect(current_path).to eq("/resorts/#{resort.id}")
  end

end
