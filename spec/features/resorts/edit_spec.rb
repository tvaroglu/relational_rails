require 'rails_helper'

RSpec.describe 'resort edit page' do
  # User Story 14, Child Update (x3)
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information to the Parent's Show page where I see the parent's updated info
  it 'links to the edit form' do
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
    click_on 'Update Resort'

    expect(current_path).to eq("/resorts/#{resort.id}/edit")
  end

  it 'can edit the resort' do
    region = Region.create!(
      name: 'US - Rocky Mountain',
      active: true,
      rvp_operations: 'Fred "Shreddy" McGnar',
      priority: 1)
    resort = region.resorts.create!(
      name: 'Crested Buttes',
      country: 'United States',
      state_province: 'CO',
      active: false,
      director_operations: 'Molly Hauck',
      ttm_revenue_usd: 0)
    visit "/resorts/#{resort.id}"
    # save_and_open_page

    expect(page).to have_content(resort.name)

    click_on 'Update Resort'
    fill_in('Name:', with: 'Crested Butte')
    fill_in('State/Province:', with: resort.state_province)
    fill_in('Country:', with: resort.country)
    choose 'Yes'
    fill_in('Director of Operations:', with: resort.director_operations)
    fill_in('Last 12 Months Total Revenue ($USD):', with: 1234567)
    click_button 'Update Resort'

    expect(current_path).to eq("/resorts/#{resort.id}")
    visit "/resorts/#{resort.id}"
    # save_and_open_page
    expect(page).to_not have_content(resort.name)
    expect(page).to_not have_content(resort.active)

    expect(page).to have_content('Crested Butte')
    expect(page).to have_content(resort.state_province)
    expect(page).to have_content(resort.country)
    expect(page).to have_content('true')
    expect(page).to have_content(resort.director_operations)
    expect(page).to have_content('1.2')
  end
end
