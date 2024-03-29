require 'rails_helper'

RSpec.describe 'resort show page' do
  # User Story 4, Child Show (x3)
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
  it 'displays the resort name and attributes' do
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

    visit "/resorts/#{resort_1.id}"
    # save_and_open_page

    expect(page).to have_content("Resort: #{resort_1.name}")
    expect(page).to have_content("Country: #{resort_1.country}")
    expect(page).to have_content("State/Province: #{resort_1.state_province}")
    expect(page).to have_content("Currently Active: #{resort_1.active}")
    expect(page).to have_content("Director of Operations: #{resort_1.director_operations}")
    expect(page).to have_content("Last 12 Months Total Revenue ($MM): #{(resort_1.ttm_revenue_usd / 1000000.to_f).round(1)}")
    expect(page).to have_content("Created At: #{resort_1.created_at}")
    expect(page).to have_content("Last Updated At: #{resort_1.updated_at}")

    expect(page).to_not have_content(resort_2.name)
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

    visit "/resorts/#{resort.id}"
    # save_and_open_page
    click_on 'Resorts Index'

    expect(current_path).to eq('/resorts')
  end

  # User Story 20, Child Delete (x3)
    # As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child redirected to the parent index page where I no longer see this parent
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

    visit "/resorts/#{resort.id}"
    # save_and_open_page

    click_on 'Delete Resort'
    expect(current_path).to eq('/resorts')

    visit '/resorts'
    # save_and_open_page
    expect(page).to_not have_content(resort.name)
  end

end
