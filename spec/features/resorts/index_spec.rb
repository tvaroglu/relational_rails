require 'rails_helper'

RSpec.describe 'resorts index page' do
  # User Story 3, Child Index (x3)
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
  it "can display all of the resorts' attributes" do
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

  it 'links to each Resort#show page' do
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
    click_on resort.name

    expect(current_path).to eq("/resorts/#{resort.id}")
  end

  # User Story 15, Child Index only shows `true` Records (x3)
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
  it 'only shows active resorts' do
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
      active: false,
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

    expect(page).to_not have_content(resort_2.name)
  end

  # User Story 18, Child Update From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'links to the child edit form' do
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

    visit '/resorts'
    # save_and_open_page
    click_on 'Update Resort'

    expect(current_path).to eq("/resorts/#{resort.id}/edit")
  end

  # User Story 23, Child Delete From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child
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

    visit '/resorts'
    # save_and_open_page

    click_on 'Delete Resort'
    expect(current_path).to eq('/resorts')

    visit '/resorts'
    # save_and_open_page
    expect(page).to_not have_content(resort.name)
  end
end
