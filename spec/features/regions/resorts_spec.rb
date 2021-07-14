require 'rails_helper'

RSpec.describe "region's resorts index" do
  describe 'parent child show' do
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

    # User Story 16, Sort Parent's Children in Alphabetical Order by name (x3)
      # As a visitor
      # When I visit the Parent's children Index Page
      # Then I see a link to sort children in alphabetical order
      # When I click on the link
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it 'can sort associated resorts in alphabetical order' do
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
      expect(resort_1.name).to appear_before(resort_2.name)

      click_on 'Sort Alphabetically'
      expect(current_path).to eq("/regions/#{region.id}/resorts")
      expect(resort_2.name).to appear_before(resort_1.name)
    end

    # User Story 21, Display Records Over a Given Threshold (x3)
      # As a visitor
      # When I visit the Parent's children Index Page
      # I see a form that allows me to input a number value
      # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      # Then I am brought back to the current index page with only the records that meet that threshold shown.
    it 'can display resorts over a given query threshold' do
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

      select(200, from: 'Minimum Revenue Threshold ($MM):')
      click_button 'Filter Resorts'
      expect(current_path).to eq("/regions/#{region.id}/resorts")

      expect(page).to have_content(resort_2.name)
      expect(page).to_not have_content(resort_1.name)
    end


  describe 'parent child creation, update, and delete' do
    # User Story 13, Parent Child Creation (x3)
      # As a visitor
      # When I visit a Parent Childs Index page
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      # When I click the link
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      # When I fill in the form with the child's attributes:
      # And I click the button "Create Child"
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      # a new child object/row is created for that parent,
      # and I am redirected to the Parent Childs Index page where I can see the new child listed
    it 'can link to the form to create new resorts from the index page' do
      region = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)

      visit "/regions/#{region.id}/resorts"
      # save_and_open_page
      click_on 'Create Resort'

      expect(current_path).to eq("/regions/#{region.id}/resorts/new")
    end

    it 'can create new resorts from the provided form' do
      region = Region.create!(
        name: 'US - Rocky Mountain',
        active: true,
        rvp_operations: 'Fred "Shreddy" McGnar',
        priority: 1)
      resort = region.resorts.create!(
        name: 'Arrowhead',
        country: 'United States',
        state_province: 'CO',
        active: false,
        director_operations: '',
        ttm_revenue_usd: 0)

      visit "/regions/#{region.id}/resorts/new"
      # save_and_open_page
      fill_in('Name:', with: resort.name)
      fill_in('Country:', with: resort.country)
      fill_in('State/Province:', with: resort.state_province)
      choose 'No'
      fill_in('Director of Operations:', with: resort.director_operations)
      fill_in('Last 12 Months Total Revenue ($USD):', with: resort.ttm_revenue_usd)
      click_button('Create Resort')

      expect(current_path).to eq("/regions/#{region.id}/resorts")

      visit "/regions/#{region.id}/resorts"
      # save_and_open_page

      expect(page).to have_content(resort.name)
      expect(page).to have_content(resort.created_at)
      expect(page).to have_content(resort.updated_at)
      expect(page).to have_content(resort.country)
      expect(page).to have_content(resort.state_province)
      expect(page).to have_content(resort.active)
      expect(page).to have_content(resort.director_operations)
      expect(page).to have_content(resort.ttm_revenue_usd)
    end
  end

  # User Story 18, Child Update From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    it 'links to the resort edit form' do
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
      click_on 'Update Resort'

      expect(current_path).to eq("/resorts/#{resort.id}/edit")
    end
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

    visit "/regions/#{region.id}/resorts"
    # save_and_open_page

    click_on 'Delete Resort'
    expect(current_path).to eq('/resorts')

    visit '/resorts'
    # save_and_open_page
    expect(page).to_not have_content(resort.name)
  end
end
